class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :log_in_user

  def current_user
    User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def log_in_user!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end

  def log_out
    user = current_user
    user.reset_session_token!
    session[:session_token] = nil
  end
end