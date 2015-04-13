module PasswordAuth
  extend ActiveSupport::Concern
  
  included do
    protect_from_forgery with: :exception
    before_filter :authenticate
    helper_method :current_user
  end

  # Check if session is authed
  def authenticate
    redirect_to new_sessions_url, :danger => "Please Login" unless current_user
  end

  def current_user
    @current_user ||= User.find_by_id session[:user_id]
  end

  # Check if session is authed
  def authenticate
    redirect_to new_sessions_url, danger: 'Please Login' unless current_user
  end
end
