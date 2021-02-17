class SpotifysController < ApplicationController
  
  def spotify
    @track = RSpotify::Track.search(song_name).first
  end
end
