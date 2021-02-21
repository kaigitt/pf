class Admin::PlayListsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @play_lists = PlayList.all
  end

  def edit
  end

  def update
  end

  def destroy
    play_list = PlayList.find(params[:id])
    play_list.delete
    redirect_to admin_play_lists_path
  end

end
