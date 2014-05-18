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

### Server


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

### Client

```
    var simple_pusher = new SimplePusher("ws://<%= request.host %>:8088/");
    simple_pusher.on("message", function(message){
        console.log("Receive:", message )
    });

    simple_pusher.on("online_count", function(message){

    });
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
