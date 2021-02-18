class SearchesController < ApplicationController
  before_action :authenticate_user!


  def index
    redirect_to root_path if params[:search] == ""
    if params[:target] == "song"
      @play_lists = PlayList.joins(:songs).where("songs.name like ?", "%#{params[:search]}%" )
    elsif params[:target] == "tag"
      @play_lists = PlayList.joins(:tags).where("tags.name like ?", "%#{params[:search]}%" )
    elsif params[:target] == 'user'
      @users = User.search_user_lists(params[:search])
    else
      @play_lists = PlayList.search_play_lists(params[:search]).limit(132)
    end
    @search = params[:search]
    @target = params[:target]
  end
end