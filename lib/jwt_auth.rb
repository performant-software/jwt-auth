require 'jwt_auth/configuration'
require 'jwt_auth/version'
require 'jwt_auth/engine'

module JwtAuth
  mattr_accessor :config, default: Configuration.new

  def self.configure(&block)
    block.call self.config
  end
end
