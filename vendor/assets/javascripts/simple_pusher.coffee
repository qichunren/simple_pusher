class SimplePusher
  constructor: (url) ->
    @websocket = new WebSocket(url)
    @websocket.onmessage = (e) ->
      event = e.data.split(":")

  on: (event_name, callback) ->
    if event_name == 'connect'
      console.log("on open")
      @websocket.onopen = callback
    else if event_name == 'message'
      console.log("on message")
      @websocket.onmessage = (e) ->
        callback(e.data)
    else if event_name == 'close'
      console.log("on close")
      @websocket.onclose = callback

  broadcast: (message) ->
    @websocket.send("broadcast:#{message}")

  emit: (event, message_object) ->
    @websocket.send("emit:#{event}:#{message_object}")


window.SimplePusher = SimplePusher