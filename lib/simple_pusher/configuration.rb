module SimplePusher
  class Configuration
    attr_accessor :port
    attr_accessor :debug

    def initialize
      @port ||= 8088
      @debug ||= false
    end
  end
end
