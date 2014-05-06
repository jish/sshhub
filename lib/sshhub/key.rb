module Sshhub
  class Key
    attr_accessor :id, :key
    def initialize(options = {})
      @id  = options[:id]
      @key = options[:key]
    end

    def to_s
      key
    end
  end
end
