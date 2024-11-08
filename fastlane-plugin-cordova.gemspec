# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/plugin/cordova/version'

Gem::Specification.new do |spec|
  spec.name          = 'fastlane-plugin-cordova'
  spec.version       = Fastlane::Cordova::VERSION
  spec.author        = %q{Almouro}
  spec.email         = %q{contact@almouro.com}

  spec.summary       = %q{Build your Cordova app}
  spec.homepage      = "https://github.com/almouro/fastlane-plugin-cordova"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"] + %w(README.md LICENSE)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  # spec.add_dependency 'your-dependency', '~> 1.0.0'
  spec.add_dependency 'nokogiri', '~> 1.16.4'

  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'fastlane', '>= 1.111.0'
end
