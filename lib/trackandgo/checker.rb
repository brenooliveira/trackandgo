module Trackandgo
  class Checker

    def initialize
      @pool = Trackandgo::RedisConnection.create
    end

    def check(key, operation = {})
      return false if Trackings.track? key
    end

    def uncheck(key, operation = {})
      return false if Trackings.track? key
    end

  end
end
