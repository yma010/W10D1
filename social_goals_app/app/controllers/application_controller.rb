class ApplicationController < ActionController::Base

  helper_method :current_user
  helper_method :logged_in?

  private

  def login_user!(user)
    #@current_user = user
    session[:session_token] = user.reset_session_token!
  end

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !!current_user
  end
end 
