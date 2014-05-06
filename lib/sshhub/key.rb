module Sshhub
  class Key
    attr_accessor :id, :key
    def initialize(options = {})
      @id  = options[:id]
      @key = options[:key]
    end

    def abridged
      "#{key[0..15]} ... #{key[(key.length - 15)..-1]}"
    end

    def to_s
      key
    end
  end
end
