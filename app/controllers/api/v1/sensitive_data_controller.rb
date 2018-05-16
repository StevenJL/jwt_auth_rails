class Api::V1::SensitiveDataController < ApplicationController
  before_action :authenticate!

  def index
    render json: {
      social_security_number: 123-45-6789,
      bank_routing_number: "4206913666"
    }
  end

  private

  def authenticate!
    auth_token = request.headers["Auth-Token"]
    decrypted_data = JwtDecodingService.new(auth_token).decrypt!
    if decrypted_data["iat"] < Time.now.to_i - 3 * months_in_seconds
      render json: {
        error: "invalid auth token"
      }, status: 401
      return
    end
    @current_user = User.find(decrypted_data["sub"])
  rescue JWT::DecodeError
    render json: {
      error: "invalid auth token"
    }, status: 401
  end

  def months_in_seconds
    60 * 24 * 30
  end
end
