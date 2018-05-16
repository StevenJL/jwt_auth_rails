class Api::V1::AuthTokensController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      auth_token = JwtGenerationService.new(user.id).token
      render json: { auth_token: auth_token }
    else
      render json: { error: "incorrect email/password combination" }, status: 401
    end
  end
end
