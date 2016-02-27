module TokenAuth
  extend ActiveSupport::Concern

  included do
    protect_from_forgery with: :null_session
    before_filter :authorize
    attr_reader :token
  end

  def authorize
    authorize_token || unauthorized
  end

  def authorize_token
    authenticate_with_http_token do |token|
      @token ||= Token.find_by_key token
    end
  end

  def unauthorized
    render json: { errors: ['Bad credentials'] }, status: 401
  end
end
