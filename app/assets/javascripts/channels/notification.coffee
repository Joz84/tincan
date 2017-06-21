App.room = App.cable.subscriptions.create "NotificationChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    console.log('Notification Channel connected to the server')

  disconnected: ->
    # Called when the subscription has been terminated by the server
    console.log('Notification Channel disconnected from the server')

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    unless data.content.blank?
      $('#unread-channel-'+data.channel_id).addClass('unread')
      console.log(data.total_messages)
