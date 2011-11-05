class SessionsController < ApplicationController
  layout nil
  def create
    @name = session[:name] = params[:name]
    @user = User.find_or_create_by_name(@name)
    @user.fetch_info!
    @user.fetch_top_artists!
    if @user.errors.any?
      render :new
    else
      redirect_to '/'
    end
  end
  
  def new
  end
end
