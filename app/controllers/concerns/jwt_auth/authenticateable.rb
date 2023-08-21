module JwtAuth
  module Authenticateable
    extend ActiveSupport::Concern

    included do
      # Actions
      before_action :authenticate_request

      def authenticate_request
        header = request.headers['Authorization']
        header = header.split(' ').last if header

        begin
          decoded = JsonWebToken.decode(header)
          klass = JwtAuth.config.model_class.constantize
          @current_user = klass.find(decoded[:id])
        rescue ActiveRecord::RecordNotFound => e
          render json: { errors: e.message }, status: :unauthorized
        rescue JWT::DecodeError => e
          render json: { errors: e.message }, status: :unauthorized
        end
      end
    end
  end
end
