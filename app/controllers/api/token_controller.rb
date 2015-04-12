class Api::TokenController < ApiController
  skip_before_filter :authorize, only: [:create]

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: user.tokens.create
    else
      render json: { errors: ['Bad credentials'] }, status: 401
    end
  end

  def destroy
    @token.destroy
  end
end
