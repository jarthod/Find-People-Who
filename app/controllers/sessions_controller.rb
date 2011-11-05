class SessionsController < ApplicationController
  def create
    session[:login] = params[:login]
    redirect_to '/'
  end
  
  def new
  end
end
