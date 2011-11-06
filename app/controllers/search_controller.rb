class SearchController < ApplicationController
  before_filter :parse
  before_filter :login_required?

  def index
    @last_url = request.url
    # /fan/<artist>
    # /attend/<event>
    render :index, :layout => nil if request.xhr?
  end
  
  def chat
  end
  
protected
  def login_required?
    redirect_to new_session_path if @user.nil?
  end

  def parse
    @filters = []
    @path = params[:path]
    @last = "User"
    @origin = @user 
    return if not @path
    @path = @path.split('/')
    while @path.any?
      filter, arg = @path.shift 2
      link = LINKS[filter]
      next if link.nil?
      @filters += [filter, arg]
      if @path.empty?
        @last = link['target']
        @origin = @last.constantize.find_by_permalink(arg)
      end
    end
  end
end
