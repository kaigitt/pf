class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all
  end

  def hide
    @user = User.find(params[:id])
    @user.update(is_deleted: true)
    redirect_to admin_users_path
  end

  def open
    @user = User.find(params[:id])
    @user.update(is_deleted: false)
    redirect_to admin_users_path
  end

  def edit

  end

  def update
  end

end
