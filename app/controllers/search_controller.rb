class SearchController < ApplicationController
  before_filter :parse
  before_filter :login_required?

  def index
    @last_url = request.path
    # /fan/<artist>
    # /attend/<event>
    render :index, :layout => nil if request.xhr?
  end
  
  def chat
    render :chat, :layout => nil if request.xhr?
  end

  def fan
    name = params[:arg]
    @last_url = params[:last_url]
    return render :status => 404, :nothing => true if name.nil? or name.empty?  
    if artist = Artist.find_by_name(name)
      return render :partial => 'suggestion', :locals => {:link => LINKS['fan'], :target => artist}
    end
    ra = (Rockstar::Artist.new(name, :include_info => true) rescue nil)
    if ra.nil? or ra.url.blank?
      return render :status => 404, :nothing => true
    end
    puts ra.inspect
    artist = Artist.from_rockstar ra
    render :partial => 'suggestion', :locals => {:link => LINKS['fan'], :target => artist}    
  end

  def listened
    name = params[:arg]
    @last_url = params[:last_url]
    return render :status => 404, :nothing => true if name.nil? or name.empty?  
    if track = Track.find_by_name(name)
      return render :partial => 'suggestion', :locals => {:link => LINKS['listened-to'], :target => track}
    end
    rt = (Rockstar::Track.new(nil, name, :include_info => true) rescue nil)
    if rt.nil?
      return render :status => 404, :nothing => true
    end
    track = Track.from_rockstar rt
    render :partial => 'suggestion', :locals => {:link => LINKS['listened-to'], :target => track}    
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
