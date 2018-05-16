class JwtDecodingService
  SIGNING_ALGORITHM = "HS256"

  def initialize(token)
    @token = token
  end

  def decrypt!
    JWT.decode(
      @token,
      secret
    ).first
  end

  private

  def secret
    "SUPER_SECRET_KEY_DO_NOT_SURE_OR_YOU_ARE_FUCKED"
  end
end
