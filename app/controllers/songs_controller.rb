class SongsController < ApplicationController
  before_action :authenticate_user!
    require 'rspotify'
  require 'open-uri'
  RSpotify.authenticate(ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_SECRET_ID'])

  def new
    @song = Song.new
  end

  def show
    @song = Song.find(params[:id])
    tracks = RSpotify::Track.search(@song.name).first(5)
    @track = tracks.find { |track| track.artists[0].name == @song.artist_name }
    @track = tracks.first if @track.nil?
    @image = @track.album.images.last["url"]
    @name = @track.artists[0].name
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
