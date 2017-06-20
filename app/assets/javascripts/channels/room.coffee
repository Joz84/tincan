App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    console.log('Connected to the server')

  disconnected: ->
    # Called when the subscription has been terminated by the server
    console.log('Disconnected from the server')

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    unless data.content.blank?
      $('#messages-table').append '<div class="message">' +
        '<h1>' + data.alias + ":" + '</h1>' +
        '<p>' + data.content + '</p>' + '</div>'
