# SimplePusher

SimplePusher is a HTML5 websocket powered realtime messaging tool used in Rails project.

## Installation

Add this line to your application's Gemfile:

    gem 'simple_pusher'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple_pusher

Then start simple pusher server when rails app boot:

    # config/initializers/simple_pusher.rb
    EventMachine.next_tick do
      SimplePusher.setup do |config|
        config.port = 8088
        config.debug = false
      end
      SimplePusher.start
    end


## Usage

Setup client js code.

```
    var simple_pusher = new SimplePusher("ws://<%= request.host %>:8088/");
    simple_pusher.broadcast("Hello everybody.");
```

Broadcast message via server side.

    SimplePusher.broadcast("Time now #{Time.now.to_s(:db}")

Message callback at server side.

  　　　SimplePusher.on("ping") do
    　　　　puts "I received ping request."
　　　　end
  　　　SimplePusher.on("ping") do
    　　　　puts "I also received ping request."
　　　  end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
