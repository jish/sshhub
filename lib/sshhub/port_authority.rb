module Sshhub
  class PortAuthority
    def self.authorize(key)
      system('mkdir', '-p', "/Users/#{whoami}/.ssh")
      File.open(filename, 'a') do |file|
        file.write("#{key}\n")
      end
    end

    private

    def self.filename
      "/Users/#{whoami}/.ssh/authorized_keys"
    end

    def self.whoami
      @whoami ||= `whoami`.rstrip
    end
  end
end
