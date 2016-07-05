require 'yaml'

require 'trackandgo/version'
require 'trackandgo/logging'
require 'trackandgo/utils/deep_symbolizable'
require 'trackandgo/trackings'

module Trackandgo

  def self.init
    Trackandgo.logger.info "========== Staring server =========="
    Trackings.load!("config/trackers.yml")
  end

  def self.logger
    Trackandgo::Logging.logger
  end

end
