require 'connection_pool'

module Trackandgo
  class RedisConnection
    class << self

      def create(options={})
        Trackandgo.info "Connecting in redis"
      end

    end
  end
end
