module SimplePusher
  class Connection
    attr_accessor :websocket
    attr_accessor :name

    def self.clients
      @@clients ||= {}
    end

    def self.add_client(socket)
      client = self.new(socket)
      clients[socket] = client
    end

    def self.remove_client(socket)
      clients.delete(socket)
    end

    def self.broadcast(message)
      clients.each do |websocket, client|
        websocket.send message
      end
    end

    def self.count
      clients.size
    end

    def initialize(websocket)
      @websocket = websocket
    end

    def emit(message)
      @websocket.send(message)
    end

  end
end