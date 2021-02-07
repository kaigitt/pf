class SongsController < ApplicationController

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    @song.save
    redirect_to play_list_path()
  end

  def destroy
  end
  private
  def song_params
    params.require(:song).permit(:name, :description)
  end
end
