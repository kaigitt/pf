class PlayListsController < ApplicationController
  def new
    @play_list = PlayList.new
    @song = @play_list.songs.build
  end

  def create
    @play_list = current_user.play_lists.new(play_list_params)
    tag_list = params[:play_list][:tag_name].split(nil)
    if @play_list.save
      @play_list.save_tag(tag_list)
      @play_list.save_song(song_list)
      redirect_to play_list_path(@play_list)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def show
    @play_list = PlayList.find(params[:id])
    @play_list_tags = @play_list.tags
    @songs = @play_list.songs
    @comments = Comment.where(play_list_id: @play_list.id)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def play_list_params
    params.require(:play_list).permit(:play_list_image_id, :title, :body, article_attributes: %I(name description))
  end
end
