App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    console.log('Connected to the server')

  disconnected: ->
    # Called when the subscription has been terminated by the server
    console.log('Disconnected from the server')

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    alert data.content
    # messages = $('.messages-container')
    # messages.append(data)
    # scroll_bottom(messages)

