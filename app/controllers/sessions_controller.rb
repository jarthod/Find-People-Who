class SessionsController < ApplicationController
  def create
    @name = session[:name] = params[:name]
    @user = User.find_or_create_by_name(@name)
    @user.fetch_info!
    if @user.errors.any?
      render :new
    else
      redirect_to '/'
    end
  end
  
  def new
  end
end
