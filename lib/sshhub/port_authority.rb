module Sshhub
  class PortAuthority
    def self.authorize(key)
      system('mkdir', '-p', "/Users/#{whoami}/.ssh")
      File.open(filename, 'a'){|f| f.write("#{key}\n") }
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
