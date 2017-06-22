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
      current_user_id = $('#current_user_id').text()
      unread_messages_nbr = $('.badge-blue').text()
      tab = gon.tab
      c = parseInt(current_user_id)
      d = parseInt(unread_messages_nbr)

      if parseInt(data.channel_id) in tab
          d = d+1
          $('#notification-'+c).removeClass('hidden')
          $('#notification-'+c).html(d)


      $('#unread-channel-'+data.channel_id).addClass('unread')
