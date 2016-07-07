require 'singleton'
require 'optparse'

module Trackandgo
  class CLI
    include Singleton

    alias_method :die, :exit
    alias_method :☠, :exit

    def parse(args=ARGV)
      parse_options(args)
    end

    def daemonize
    end

    def parse_options(argv)
      opts = {}
      @parser = OptionParser.new do |opt|
        opt.on '-V', '--version', "Print version and exit" do |arg|
          puts "Trackandgo #{Trackandgo::VERSION}"
          die(0)
        end
      end

      @parser.banner = "Usage: trackandgo [options]"
      @parser.on_tail "-h", "--help", "Show help" do
        puts @parser
        die 1
      end

      @parser.parse!(argv)
    end
  end
end