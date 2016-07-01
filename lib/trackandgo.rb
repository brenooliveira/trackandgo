require 'yaml'

require 'trackandgo/version'
require 'trackandgo/utils/deep_symbolizable'
require 'trackandgo/trackings'

module Trackandgo
  class << self

    def init
      Trackings.load!("config/trackers.yml")
    end

  end
end
