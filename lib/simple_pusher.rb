require 'simple_pusher/version'
require 'em-websocket'
require 'simple_pusher/engine' if defined?(Rails)

module SimplePusher
  autoload :Configuration, 'simple_pusher/configuration'
  autoload :Connection,    'simple_pusher/connection'
  autoload :Server,        'simple_pusher/server'
  autoload :Middleware,    'simple_pusher/middleware'


  class << self
    def setup
      yield configuration
      configuration
    end

    def configuration
      @_configuration ||= Configuration.new
    end
  end

  def start(_options = {})
    EventMachine.next_tick do
      Server.start
    end
  end

  # Publish message to all connected socket.
  # And the client websocket which listened 'channel' will get message callback.
  def publish(channel, message = '')
    Connection.publish(channel, message)
  end

  def on(event, &callback)
    Connection.on(event, &callback)
  end

  module_function :start
  module_function :publish
  module_function :on
end
