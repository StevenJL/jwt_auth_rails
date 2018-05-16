require "digest"

class JwtGenerationService
  SIGNING_ALGORITHM = "HS256"

  # @param user_id [Integer] the id of the user to be encoded.
  def initialize(user_id)
    @user_id = user_id
  end

  # Encoded JWT token using the secret token for the application.
  #
  # @return [String] encoded JWT token.
  def token
    JWT.encode(payload, secret, SIGNING_ALGORITHM)
  end

  private

  def payload
    @payload ||= {
      # issued_at
      iat: current_time,

      # subject
      sub: @user_id,
    }
  end

  def current_time
    Time.now.to_i
  end

  def secret
    "SUPER_SECRET_KEY_DO_NOT_SURE_OR_YOU_ARE_FUCKED"
  end
end
