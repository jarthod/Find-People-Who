class SearchController < ApplicationController
  def index
    @path = params[:path]
  end
end
