class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def requireLogin
    if !logged_in?
      flash[:alert] = "You need to be logged in to access this area!"
      redirect_to login_path
    end
  end
end
