class SearchesController < ApplicationController
  before_action :authenticate_user!

  def index
    redirect_to root_path if params[:search] == ""
    # @split_keyword = params[:search].split(/[[:blank:]]+/) 余裕があれば複数キーワード検索
    if params[:target] == "song"
      @songs = Song.search_song_lists(params[:search])
    elsif params[:target] == "tag"
      @tags = Tag.search_tag_lists(params[:search])
    elsif params[:target] == 'user'
      @users = User.search_user_lists(params[:search])
    else
      @play_lists = PlayList.search_play_lists(params[:search]).limit(132)
    end
    @search = params[:search]
  end
end