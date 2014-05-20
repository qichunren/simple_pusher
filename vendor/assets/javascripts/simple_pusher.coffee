class SimplePusher
  constructor: (url) ->
    @websocket = new WebSocket(url)
    @_callbacks ||= {}
    @websocket.onmessage = (e) =>
      data = e.data.split(":")
      event = data[0]
      message = data[1..-1].join(":")
      callback_fn.call(this, message) for callback_fn in @_callbacks[event]

  on: (event_name, callback_fn) ->
    @_callbacks[event_name] = (@_callbacks[event_name] ||= [])
    @_callbacks[event_name].push(callback_fn)
    this

  broadcast: (message) ->
    @websocket.send("broadcast:#{message}")

  emit: (event, message_object) ->
    @websocket.send("emit:#{event}:#{message_object}")


window.SimplePusher = SimplePusher