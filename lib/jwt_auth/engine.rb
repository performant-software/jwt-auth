module JwtAuth
  class Engine < ::Rails::Engine
    isolate_namespace JwtAuth
    config.generators.api_only = true
  end
end
