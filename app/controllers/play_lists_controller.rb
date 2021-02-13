class PlayListsController < ApplicationController
  before_action :authenticate_user!

  def new
    @play_list = PlayList.new
    5.times { @play_list.songs.build }
  end

  def create
    @play_list = PlayList.new(play_list_params)
    @play_list.user_id = current_user.id
    tag_list = params[:play_list][:name].split(",")
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

  def tagAutocomplete
    @tags = Tag.all.where('name LIKE ?', "%#{params[:term]}%")
    render json: @tags.map{ |tag| {name: tag.name, count: tag.play_lists.count}}.to_json
  end

  def edit
  end

  def update
  end

  def destroy
    play_list = PlayList.find(params[:id])
    play_list.delete
    redirect_to user_path(play_list.user_id)
  end

  private
  def play_list_params
    params.require(:play_list).permit(:play_list_image, :title, :body, play_list_songs_attributes: [:name], songs_attributes: [:name, :artist_name, :description])
  end
end
