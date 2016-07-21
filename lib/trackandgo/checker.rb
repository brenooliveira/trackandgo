module Trackandgo
  class Checker

    def check(key, operation = {})
      raise ArgumentError if key.nil?
      return false unless Trackings.track? operation[:route]

      Trackandgo.redis do |conn|
        route = operation[:route].split('.')
        hash = route.reverse.inject(true) { |a, n| { n => a } }
        conn.set key, hash
      end
    end

    def uncheck(key, operation = {})
      return false if Trackings.track? operation[:route]
    end

  end
end
