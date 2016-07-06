require 'yaml'

require 'trackandgo/version'
require 'trackandgo/logging'
require 'trackandgo/utils/deep_symbolizable'
require 'trackandgo/trackings'
require 'trackandgo/udp/server'

module Trackandgo

  @_settings = {
    UDP_HOST: '127.0.0.1',
    UDP_PORT: '3333'
  }

  def self.init
    Trackandgo.logger.info "========== Staring server =========="
    Trackings.load!("config/trackers.yml")

    Trackandgo::UDP::Server.new(@_settings).start
  end

  def self.logger
    Trackandgo::Logging.logger
  end

end
