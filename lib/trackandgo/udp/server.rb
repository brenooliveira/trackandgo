require 'socket'

module Trackandgo
  module UDP
    class Server
      def initialize(params = {})
        BasicSocket.do_not_reverse_lookup = true
        @params = params
      end

      def start
        Trackandgo.logger.info " * UDP Server up √"
        Socket.udp_server_loop(@params[:UDP_PORT]) do |msg, msg_src|
          Trackandgo.logger.info "UDP Receive: #{msg} :: #{msg_src.inspect}"
        end
      end

    end
  end
end
