Rails.application.routes.draw do
  post '/auth/login', to: 'jwt_auth/authentication#login'
end
