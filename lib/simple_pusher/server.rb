require 'singleton'
require 'em-websocket'
require 'connection'

module SimplePusher
  class Server
    include Singleton

    attr :host, :port

    def initialize(options={})
      @host = "0.0.0.0"
      @port = options[:port] || 8088
    end

    def self.start(options={})
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

        socket.onmessage do |message|
          $stderr.puts "on message: " + message if SimplePusher.configuration.debug
          #action, *message = msg.split(":")
          #
          #case action
          #  when 'broadcast'
          #    message = message.join(":")
          #    Client.broadcast(message)
          #  when 'emit'
          #    event = message[0]
          #    message = message[1..-1].join(":")
          #  #TODO
          #  else
          #
          #end
        end


      end
    end

  end
end