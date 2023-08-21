require 'jwt_auth/json_web_token'

module JwtAuth
  class AuthenticationController < ActionController::API

    def login
      klass = JwtAuth.config.model_class.constantize
      login_attribute = JwtAuth.config.login_attribute.to_sym

      user = klass.find_by(login_attribute => params[login_attribute.to_s])

      if user&.authenticate(params[:password])
        username = user.send(login_attribute)
        expiration = expiration_date

        token = JsonWebToken.encode(id: user.id, exp: expiration.to_i)
        render json: { token: token, exp: expiration.iso8601, username: username }, status: :ok
      else
        render status: :unauthorized
      end
    end

    private

    def expiration_date
      ENV.fetch('JWT_AUTH_EXPIRATION') { JsonWebToken::DEFAULT_TOKEN_EXPIRATION }.to_i.hours.from_now
    end
  end
end
