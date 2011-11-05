class SearchController < ApplicationController
  before_filter :parse

  def index
    @last_url = request.url
    # /fan/<artist>
    # /attend/<event>
  end
  
protected
  def parse
    @path = params[:path]
    @last = "User"
    @origin = @user 
    return if not @path
    @path = @path.split('/')
    while @path.any?
      filter, arg = @path.shift 2
      puts "Filter #{filter} = #{arg}"
      link = LINKS[filter]
      if @path.empty?
        @last = link
        @origin = nil
      end
    end
  end
end
