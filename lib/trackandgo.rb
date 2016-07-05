require 'yaml'

require File.expand_path 'trackandgo/version'
require 'trackandgo/logging'
require 'trackandgo/utils/deep_symbolizable'
require 'trackandgo/trackings'

module Trackandgo
  class << self

    def init
      Trackandgo.info "========== Staring server =========="
      Trackings.load!("config/trackers.yml")
    end

    def logger
      Trackandgo::Logging.logger
    end

  end
end
