# JwtAuth
The JWT Auth engine provides a way to do simple JSON Web Token authentication in your Rails application.

## Usage
How to use my plugin.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'jwt_auth', git: 'https://github.com/performant-software/jwt-auth.git', tag: 'v0.1.0'
```

And then execute:
```bash
$ bundle install
```

Or install it yourself as:
```bash
$ gem install jwt_auth
```

## Configuration
In `/config/initializers` add a `jwt_auth` configuration file to define your model and login attribute:

```ruby
JwtAuth.configure do |config|
  config.model_class = 'User'
  config.login_attribute = 'email'
end

```

Mount the engine in the `/config/routes.rb` file:

```ruby
Rails.application.routes.draw do
  mount JwtAuth::Engine => '/auth'

  # Other routes here...
```

## Usage
You can now make `POST` requests to `/auth/login` with the following payload:

```json
{
  "email": "example@example.com",
  "password": "password"
}
```

To authenticate each request coming into your application, use the `Authenticateable` concern in your base controller:

```ruby
class MyBaseController < ApplicationController
  include JwtAuth::Authenticateable
end
```
