class HomesController < ApplicationController
   before_action :authenticate_user!,except: [:top, :about]
   
  def top
    @play_list_ranks = PlayList.find(Favorite.group(:play_list_id).order('count(play_list_id) desc').limit(6).pluck(:play_list_id))
    @user = User.all
  end

  def about

  end
end
