class SearchesController < ApplicationController

  def index
    @play_lists = PlayList.search_pl(params[:search]).limit(132)
    @search = params[:search]
  end
end
