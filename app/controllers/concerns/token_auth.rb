module TokenAuth
  included do
    before_filter :authorize
    protect_from_forgery with: :null_session
  end

  def authorize
    authorize_token || unauthorized
  end

  def authorize_token
    authenticate_with_http_token do |token|
      Token.where(hash: token).limit(1).length > 0
    end
  end

  def unauthorized
    render json: { errors: ['Bad credentials'] }, status: 401
  end
end
