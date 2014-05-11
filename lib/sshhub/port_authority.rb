module Sshhub
  class PortAuthority
    def self.authorize(keys)
      system('mkdir', '-p', "/Users/#{whoami}/.ssh")

      [*keys].each do |key|
        File.open(filename, 'a'){|f| f.write("#{key}\n") }
      end
    end

    def self.revoke(keys)
      system('mkdir', '-p', "/Users/#{whoami}/.ssh")
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
      "/Users/#{whoami}/.ssh/authorized_keys"
    end

    def self.whoami
      @whoami ||= `whoami`.rstrip
    end
  end
end
