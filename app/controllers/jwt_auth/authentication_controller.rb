module JwtAuth
  class AuthenticationController < ActionController::API
    # Constants
    DEFAULT_TOKEN_EXPIRATION = 24

    def login
      klass = JwtAuth.config.model_class.constantize
      login_attribute = JwtAuth.config.login_attribute.to_sym
      user_serializer = JwtAuth.config.user_serializer.constantize

      user = klass.find_by(login_attribute => params[login_attribute.to_s])

      if user&.authenticate(params[:password])
        expiration = expiration_date
        token = JsonWebToken.encode(id: user.id, exp: expiration.to_i)

        user_json = user_serializer.new.render_show(user)
        render json: { token: token, exp: expiration.iso8601, user: user_json }, status: :ok
      else
        render status: :unauthorized
      end
    end

    private

    def expiration_date
      ENV.fetch('JWT_AUTH_EXPIRATION') { DEFAULT_TOKEN_EXPIRATION }.to_i.hours.from_now
    end
  end
end
