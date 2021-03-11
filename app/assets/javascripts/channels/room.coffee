document.addEventListener 'turbolinks:load', ->
  App.room = App.cable.subscriptions.create { channel: "RoomChannel", room: $('#messages').data('room_id') },
    connected: ->
    # Called when the subscription is ready for use on the server

    disconnected: ->
    # Called when the subscription has been terminated by the server

    # received: (data) ->
    #   if data["isCurrent_user"]==true
    #     message = `<div class='mycomment'><p>${data["message"]}</p></div>`
    #   else
    #     message = `<div class='fukidasi'><div class='chatting'><div class='says'><p>${data["message"]}</p></div></div></div>`
    #   $('#chats').append(message)

    speak: (message) ->
      @perform 'speak', message: message, room: $('#messages').data('room_id')

$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
  if event.keyCode is 13 # return = send
    App.room.speak event.target.value
    event.target.value = ''
    event.preventDefault()