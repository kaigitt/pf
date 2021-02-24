class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @play_lists = @user.play_lists
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    if request.referer&.include?('/mypages/resign')
      redirect_to root_path
    else
      redirect_to profile_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :age, :profile_image, :introduction)
  end

end
