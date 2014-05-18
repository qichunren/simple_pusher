# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simple_pusher/version'

Gem::Specification.new do |spec|
  spec.name          = "simple_pusher"
  spec.version       = SimplePusher::VERSION
  spec.authors       = ["qichunren"]
  spec.email         = ["whyruby@gmail.com"]
  spec.description   = %q{Simple pusher based on websocket}
  spec.summary       = %q{Simple pusher based on websocket, build with Eventmachine}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "em-websocket", "~> 0.5.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
