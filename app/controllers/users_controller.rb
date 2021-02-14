class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @play_lists = @user.play_lists
  end

  def edit
    @user = User.find(params[:id])
    @contact = Contact.new
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :age, :profile_image, :introduction)
  end
end
