# SimplePusher

SimplePusher is a HTML5 websocket powered realtime messaging tool used in Rails / Sintra project.

## Installation

[![Gem Version](https://badge.fury.io/rb/simple_pusher@2x.png)](http://badge.fury.io/rb/simple_pusher)

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

### Note

As initializer code `config/initializers/simple_pusher.rb` show, your rails runtime environment must be in EventMachine run loop. Otherwise you start EventMachine run loop in a new thread.

## Usage

Setup client js code.

Add `//= require simple_pusher` to app/assets/javascripts/application.js

Add code to app/views/layouts/application.html.erb
```
<script type="text/javascript">
    var simple_pusher = new SimplePusher("ws://<%= request.host %>:8088/");
    simple_pusher.broadcast("Hello everybody.");
</script>
```

Broadcast message via server side.

```
SimplePusher.broadcast("Time now #{Time.now.to_s(:db}")
```

Message callback at server side.

```
SimplePusher.on("ping") do
  puts "I received ping request."
end

SimplePusher.on("ping") do
  puts "I also received ping request."
end
```

## Emulating WebSockets in older browsers
It is possible to emulate WebSockets in older browsers using flash emulation. For example take a look at the [web-socket-js](https://github.com/gimite/web-socket-js) project.

## TODO

* Add `on` method message callback to client js.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
