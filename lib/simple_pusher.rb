require "simple_pusher/version"
require 'em-websocket'
require 'simple_pusher/engine' if defined?(Rails)

module SimplePusher

  class << self
    def setup
      yield configuration
      configuration
    end

    def configuration
      @_configuration ||= Configuration.new
    end
  end

  def start(options={})
    EventMachine.next_tick do
      Server.start
    end
  end

  def broadcast(message)
    Connection.broadcast(message)
  end

  def on(event, &callback)
    Connection.on(event, &callback)
  end

  module_function :start
  module_function :broadcast
  module_function :on

end

SimplePusher.autoload :Configuration, "simple_pusher/configuration"
SimplePusher.autoload :Connection,    "simple_pusher/connection"
SimplePusher.autoload :Server,        "simple_pusher/server"