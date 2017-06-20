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
        '<li><h1>' + data.alias + '</h1>' +
        '<p>' + data.content + '</p>' + '</li></div>'
      scroll_bottom()

App.room = App.cable.subscriptions.create "NotificationChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    console.log('Connected to the server')

  disconnected: ->
    # Called when the subscription has been terminated by the server
    console.log('Disconnected from the server')

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    unless data.content.blank?
      $('#unread-channel-'+data.channel_id).addClass('unread');
      console.log(data.total_messages);
      $('.badge badge-blue').append '' + data.total_messages
      scroll_bottom()

$(document).ready ->
  submit_message()
  scroll_bottom()

submit_message = () ->
  $('#message_content').on 'keydown', (event) ->
    if event.keyCode is 13
      $('input').click()
      event.target.value = ""
      event.preventDefault()

scroll_bottom = () ->
  $('#message').scrollTop($('#messages-table')[0].scrollHeight)
