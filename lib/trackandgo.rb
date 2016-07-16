require 'yaml'
require 'concurrent'
require 'redis'
# require 'concurrent-edge'

require 'trackandgo/version'
require 'trackandgo/logging'
require 'trackandgo/utils/deep_symbolizable'
require 'trackandgo/utils/hash'
require 'trackandgo/trackings'
require 'trackandgo/udp/server'
require 'trackandgo/cli'
require 'trackandgo/checker'
require 'trackandgo/redis_connection'

module Trackandgo
  class << self
    DEFAULTS = {
      UDP_HOST: '127.0.0.1',
      UDP_PORT: '3333'
    }

    def init
      Trackandgo.logger.info "========== Staring server =========="
      Trackings.load!("config/trackers.yml")

      Trackandgo::UDP::Server.new(DEFAULTS).start
    end

    def self.options
      @options ||= DEFAULTS.dup
    end

    def self.options=(opts)
      @options = opts
    end


    def logger
      Trackandgo::Logging.logger
    end

    def logger=(log)
      Trackandgo::Logging.logger = log
    end

    def redis
      raise ArgumentError, "missing a block" unless block_given?
      redis_pool.with do |conn|
        begin
          yield conn
        rescue Redis::CommandError => ex
          conn.disconnect!
          raise
        end
      end
    end

    def redis_pool
      @redis ||= Trackandgo::RedisConnection.create
    end

  end
end
