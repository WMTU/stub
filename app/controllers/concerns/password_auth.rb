module PasswordAuth
  included do
    helper_method :current_user
  end

  # Get current user
  def current_user
    @current_user ||= User.find(session[:user_id]) unless session[:user_id].nil?
  end

  # Check if session is authed
  def authenticate
    redirect_to new_sessions_url, :danger => "Please Login" unless current_user
  end
end
