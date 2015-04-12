class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate

  def current_user
    @current_user ||= User.find_by_id session[:user_id]
  end
  helper_method :current_user

  # Check if session is authed
  def authenticate
    redirect_to new_sessions_url, danger: 'Please Login' unless current_user
  end
end
