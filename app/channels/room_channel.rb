class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel_#{params['room']}"
  end

  def unsubscribed
  end

  def speak(data)
    Message.create! body: data['message'], room_id: data['room'], user_id: current_user.id
  end
end
