App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    console.log('Room Channel connected to the server')

  disconnected: ->
    # Called when the subscription has been terminated by the server
    console.log('Room Channel disconnected from the server')

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    unless data.content.blank?
      $('#delete-btn-'+data.user_id).append '<a data-confirm="Are you sure! Do you want delete this post" rel="nofollow" data-method="delete" href="/channels/'+data.channel_id+'/messages/'+data.message_id+'">delete</a>'
      $('#messages-table').append '<li><div id="message-infos"><h1>' + data.alias + '</h1> <p> | '+ data.msg_date+'</p></div>' +
        '<p>' + data.content + '</p></li>'
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
