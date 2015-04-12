class Api::TokenController < ApiController
  skip_before_filter :authorize, only: [:create]

  def create
    user = User.find_by(email: session_params[:email])
    if user && user.authenticate(session_params[:password])
      render json: user.tokens.create
    else
      render json: { errors: ['Bad credentials'] }, status: 401
    end
  end

  def destroy
    @token.destroy
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
