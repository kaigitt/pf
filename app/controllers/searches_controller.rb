class SearchesController < ApplicationController
  before_action :authenticate_user!

  def index
    @play_lists = PlayList.search_play_lists(params[:search]).limit(132)
    @search = params[:search]
  end
end
