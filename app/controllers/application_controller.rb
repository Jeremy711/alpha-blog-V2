class ApplicationController < ActionController::Base

#helper method in helpers are only available to views
#helper methods in application controller are only available for controllers
#need below line for it to be available in both
helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:alert] = "You must be logged in to view this action"
      redirect_to login_path
    end
  end
end
