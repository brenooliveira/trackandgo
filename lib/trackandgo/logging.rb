require 'logger'

module Trackandgo
  module Logging
    def self.logger
      Logger.new(STDOUT)
    end
  end
end
