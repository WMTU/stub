class Api::TokensController < ApiController
  skip_before_filter :authorize, only: [:create]

  def create
    user = User.find_by(email: session_params[:email])
    if user && user.authenticate(session_params[:password])
      respond_with user.tokens.create, location: root_path
    else
      respond_with errors: ['Bad credentials'], status: 401, location: root_path
    end
  end

  def destroy
    respond_with @token.destroy, location: root_path
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
