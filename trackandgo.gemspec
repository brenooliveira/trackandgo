# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'trackandgo/version'

Gem::Specification.new do |spec|
  spec.name          = "trackandgo"
  spec.version       = Trackandgo::VERSION
  spec.authors       = ["Breno Oliveira"]
  spec.email         = ["breno26@gmail.com"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.summary       = %q{}
  spec.description   = %q{Write a longer description or delete this line.}
  spec.homepage      = "http://trackandgo.io"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
  spec.add_dependency 'connection_pool'
  spec.add_dependency 'i18n'
  spec.add_dependency 'concurrent-ruby'
  spec.add_dependency 'redis'
end
