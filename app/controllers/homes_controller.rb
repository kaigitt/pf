class HomesController < ApplicationController
   before_action :authenticate_user!,except: [:top, :about, :before_signin, :before_signup]

   def before_signin
   end

   def before_signup
   end

   def top
   #  @play_list_ranks = PlayList.find(Favorite.group(:play_list_id).order('count(play_list_id) desc').limit(8).pluck(:play_list_id))
     @users = User.all
     @play_lists_intro = PlayList.last(50).shuffle.last(20)
     @songs = Song.last(50).shuffle.last(10)
     @tags =Tag.last(20)
     @todays_play_list = PlayList.last
   #  ランダむに並べ替える処理
   end

  def about

  end
end
