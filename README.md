# SimplePusher

SimplePusher is a HTML5 websocket powered realtime messaging tool.

## Installation

Add this line to your application's Gemfile:

    gem 'simple_pusher'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple_pusher

## Usage

1. Start simple pusher server in rails config/initializers.

```
# config/initializers/simple_pusher.rb
EventMachine.next_tick do
  SimplePusher.setup do |config|
    config.port = 8088
    config.debug = false
  end
  SimplePusher.start
end
```

2. Setup client js code.

```
    var simple_pusher = new SimplePusher("ws://<%= request.host %>:8088/");
    simple_pusher.on("message", function(message){
        console.log("Receive:", message )
    });

    simple_pusher.on("online_count", function(message){

    });
```

3. Broadcast message via server side.

```
SimplePusher.broadcast("Time now #{Time.now.to_s(:db}")
```

4. Broadcast message via client side.

```
simple_pusher.broadcast("Hello everybody.")
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
