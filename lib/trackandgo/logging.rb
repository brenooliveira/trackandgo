require 'logger'

module Trackandgo
  module Logging
    def logger
      Logger.new(STDOUT)
    end
  end
end
