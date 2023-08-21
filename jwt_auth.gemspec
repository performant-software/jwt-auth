require_relative 'lib/jwt_auth/version'

Gem::Specification.new do |spec|
  spec.name        = 'jwt_auth'
  spec.version     = JwtAuth::VERSION
  spec.authors     = ['Performant Software Solutions']
  spec.email       = ['derek@performantsoftware.com']
  spec.homepage    = 'https://github.com/performant-software/jwt-auth'
  spec.summary     = 'Simple authentication via JSON Web Token'
  spec.description = 'Provides a way to authenticate users via JSON Web Token'
  spec.license     = 'MIT'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  end

  spec.add_dependency 'rails', '~> 7.0.7'
  spec.add_dependency 'jwt', '~> 2.7.1'
end
