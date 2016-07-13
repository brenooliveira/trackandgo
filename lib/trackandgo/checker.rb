module Trackandgo
  class Checker

    def initialize
      @pool = Trackandgo::RedisConnection.create
    end

    def check(key, operation = {})
      # @pool.
    end

    def uncheck(key, operation = {})
    end



  end
end
