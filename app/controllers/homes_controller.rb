class HomesController < ApplicationController
   before_action :authenticate_user!,except: [:top, :about, :before_signin, :before_signup]

   def before_signin
   end

   def before_signup
   end

   def top
     @users = User.all
     @play_lists = PlayList.all
   end

  def about

  end
end
