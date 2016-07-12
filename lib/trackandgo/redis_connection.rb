require 'connection_pool'

module Trackandgo
  class RedisConnection
    class << self

      def create(opts={})
        Trackandgo.logger.info "Connecting in redis"
        pool_size = opts[:pool_size] || 5
        timeout   = opts[:network_timeout] || 5
        @pool = ConnectionPool.new(size: pool_size, timeout: timeout)  do
          Redis.new
        end
        @pool
      end

      def shutdown
        @pool.shutdown { |conn| conn.quit }
      end

    end
  end
end
