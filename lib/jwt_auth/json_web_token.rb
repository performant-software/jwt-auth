require 'jwt'

module JwtAuth
  class JsonWebToken
    SECRET_KEY = Rails.application.secrets.secret_key_base.to_s
    DEFAULT_TOKEN_EXPIRATION = 24

    def self.encode(payload)
      JWT.encode(payload, SECRET_KEY)
    end

    def self.decode(token)
      decoded = JWT.decode(token, SECRET_KEY)[0]
      HashWithIndifferentAccess.new decoded
    end
  end
end
