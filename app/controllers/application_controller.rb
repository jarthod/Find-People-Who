class ApplicationController < ActionController::Base
  before_filter :authenticate

  protect_from_forgery
  
protected
  def authenticate
    @name = session[:name]
    @user = User.find_by_name(@name)
  end
end
