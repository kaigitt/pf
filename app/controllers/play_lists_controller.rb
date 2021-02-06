class PlayListsController < ApplicationController
  def new
    @play_list = PlayList.new
    @song = Song.new
  end

  def create
    play_list = Play_lists.new(play_list_params)
    tag_list = params[:play_list][:tag_name].split(nil)
    song = Song.new(song_params)
    if @play_list.save
      @play_list.save_tag(tag_list)
      redirect_to play_list_path(@play_list)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def show
    @play_list = PlayList.find(params[:id])
    @play_list_tags = @play_list.tags
    @comments = Comment.where(play_list_id: @play_list.id)
    @comment = Comment.new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def play_list_params
    params.require(:play_list).permit(:play_list_image_id, :title, :body).merge(user_id: current_user.id)
  end

  def song_params
    params.require(:song).permit(:name, :description).merge(user_id: current_user.id)
  end
end
