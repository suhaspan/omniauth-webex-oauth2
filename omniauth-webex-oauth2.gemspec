# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/webex/version'

Gem::Specification.new do |spec|
  spec.name          = 'omniauth-webex-oauth2'
  spec.version       = OmniAuth::Webex::VERSION
  spec.authors       = ['Suhas Nehete']
  spec.email         = ['suhas0284@gmail.com']

  spec.summary       = %q{A Cisco WebEx Teams (Cisco Spark) OAuth2 strategy.}
  spec.description   = %q{A Cisco WebEx Teams (Cisco Spark) OAuth2 strategy. Create an account and generate client_id and client_secret.}
  spec.homepage      = 'https://github.com/suhaspan/omniauth-webex-oauth2'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'omniauth-oauth2', '~> 1.2'

  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.4'
end
