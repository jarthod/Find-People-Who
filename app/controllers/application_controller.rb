class ApplicationController < ActionController::Base
  before_filter :authenticate

  protect_from_forgery
  
protected
  def authenticate
    @login = session[:login]
  end
end
