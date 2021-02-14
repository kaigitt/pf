class MypagesController < ApplicationController

  def social
    @user = User.find(current_user.id)
  end

  def profile
    @user = User.find(current_user.id)
  end

  def account
    @user = User.find(current_user.id)
  end
end
