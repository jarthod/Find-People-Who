class SearchController < ApplicationController
  def index
    @path = params[:path]
    
    # /fan/<artist>
    # /attend/<event>
  end
end
