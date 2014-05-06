require 'octokit'

module Sshhub
  class Keychain
    attr_reader :username

    def initialize(username)
      @username = username
    end

    def keys
      api_data.map{|key| Sshhub::Key.new(key) }
    end

    private

    def api_data
      client.user_keys(username)
    end

    def client
      @client ||= Octokit::Client.new
    end
  end
end
