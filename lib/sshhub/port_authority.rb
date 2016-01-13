module Sshhub
  class PortAuthority
    def self.authorize(keys)
      system('mkdir', '-p', ssh_dir)

      [*keys].each do |key|
        File.open(filename, 'a'){|f| f.write("#{key}\n") }
      end
    end

    def self.revoke(keys)
      system('mkdir', '-p', ssh_dir)
      revoked = authorized_keys - [*keys].map(&:key)
      File.open(filename, "w"){|f| f.puts revoked }
    end

    def self.present?(keys)
      ([*keys].map(&:key) & authorized_keys).any?
    end

    private

    def self.authorized_keys
      File.open(filename, 'r').read.split("\n")
    rescue Errno::ENOENT => e
      []
    end

    def self.filename
      "#{ssh_dir}/authorized_keys"
    end

    def self.ssh_dir
      @ssh_dir ||= "#{ENV['HOME']}/.ssh"
    end
  end
end
