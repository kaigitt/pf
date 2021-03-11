# class RoomChannel < ApplicationCable::Channel
#   def subscribed
#     stream_from "room_channel_#{params['room']}"
#     stream_for current_user.id
#   end

#   def unsubscribed
#   end

#   def speak(data)
#   end

#   # def speak(data)
#   #   Message.create!(body: data['message'], room_id: data['room'], user_id: current_user.id)
#   #       if data["message"]
#   #     Message.create!(
#   #       user_id: current_user.id,
#   #       room_id: data['room'],
#   #       message: data["message"]
#   #     )
#   #     #画面を開いているのがチャット送信者だった場合
#   #     ChatChannel.broadcast_to current_user.id,
#   #       message: data["message"],
#   #       room_id: data['room'],
#   #       isCurrent_user: true

#   #     #画面を開いているのがチャット受信者だった場合
#   #     ChatChannel.broadcast_to data["partner_id"].to_i,
#   #       message: data["message"],
#   #       room_id: data['room'],
#   #       isCurrent_user: false
#   #   end
#   # end
# end
