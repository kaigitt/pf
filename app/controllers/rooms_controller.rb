class RoomsController < ApplicationController

  def show
    protect_room(params[:id])
    @room = Room.find(params[:id])
    @messages = @room.messages
  end

  def create
    @r = find_room(params[:id])
    if @r
      redirect_to "/rooms/#{@r.id}}"
    else
      @room = Room.new(name: "room@#{params[:id]}@#{current_user.id}")
      @room.save
      redirect_to "/rooms/#{@room.id}"
    end
  end


  private

  def protect_room(room_id)
    @room = Room.find room_id
    id = @room.name.split("@")
    unless id.find { |i| i.to_i == current_user.id.to_i }
      redirect_to users_path
    end
  end

  def find_room(id)
    @rooma = Room.find_by(name: "room@#{id}@#{current_user.id}")
    @roomb = Room.find_by(name: "room@#{current_user.id}@#{id}")
    @r = @rooma || @roomb
    return @r
  end

end
