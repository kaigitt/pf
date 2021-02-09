class Admin::PlayListsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @play_lists = PlayList.all
  end

  def edit
  end

  def update
  end

end
