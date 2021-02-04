class PlayListsController < ApplicationController
  def new
    @play_list = PlayList.new
  end

  def create
    @play_list = PlayList.new(play_list_params)
    if @play_list.save
      redirect_to "/"
    else
      render :new
    end

  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def play_list_params
    params.require(:play_list).permit(:play_list_image_id, :title, :body)
  end
end
