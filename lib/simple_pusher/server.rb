require 'singleton'
require 'em-websocket'
require 'connection'

module SimplePusher
  class Server
    include Singleton

    attr :host, :port

    def initialize
      @host = "0.0.0.0"
      @port = SimplePusher.configuration.port
    end

    def self.start
      $stderr.puts "Start SimplePush ..." if SimplePusher.configuration.debug
      EM::WebSocket.run(:host => instance.host, :port => instance.port) do |socket|
        socket.onopen do |handshake|
          $stderr.puts "on open:" + handshake.inspect if SimplePusher.configuration.debug
          Connection.add_client(socket)
        end

        socket.onclose do
          $stderr.puts "on close"
          Connection.remove_client(socket)
        end

        socket.onmessage do |raw_message|
          $stderr.puts "on message: " + raw_message if SimplePusher.configuration.debug
          action, *message = raw_message.split(":")

          case action
           when 'broadcast'
             message = message.join(":")
             Connection.broadcast(message)
           else
             #TODO
          end
        end


      end
    end

  end
end