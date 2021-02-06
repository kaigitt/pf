class SongsController < ApplicationController

  def new
    @play_list = params[:title]
    @song_body = params[:body]
  end

  def create
  end

  def destroy
  end
end
