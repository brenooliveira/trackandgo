require 'logger'

module Trackandgo
  module Logging

    def self.initialize_logger(target = STDOUT)
      oldlogger = defined?(@logger) ? @logger : nil
      @logger = Logger.new(target)
      @logger.level = Logger::INFO

      @logger
    end

    def self.logger
      defined?(@logger) ? @logger : Logger.new(STDOUT)
    end

    def self.logger=(log)
      @logger = (log ? log : Logger.new(File::NULL))
    end
  end
end
