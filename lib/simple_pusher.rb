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

  module_function :start

end

SimplePusher.autoload :Configuration, "simple_pusher/configuration"
SimplePusher.autoload :Connection,    "simple_pusher/connection"
SimplePusher.autoload :Server,        "simple_pusher/server"