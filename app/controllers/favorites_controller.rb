class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    play_list = PlayList.find(params[:play_list_id])
    @favorite = Favorite.create(user_id: current_user.id, play_list_id: play_list.id)
    play_list.create_notification_by(current_user)
    redirect_to play_list_path(play_list)
  end

  def destroy
    play_list = PlayList.find(params[:play_list_id])
    @favorite = Favorite.find_by(user_id: current_user.id, play_list_id: play_list.id)
    if @favorite.destroy
      redirect_to play_list_path(play_list)
    end
  end
end
