# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'emoruby/version'

Gem::Specification.new do |spec|
  spec.name          = "emoruby"
  spec.version       = Emoruby::VERSION
  spec.authors       = ["Justin Searls"]
  spec.email         = ["searls@gmail.com"]
  spec.summary       = %q{A little emoji language that compiles down to Ruby}
  spec.description   = %q{A little emoji language that compiles down to Ruby. It's just ruby}
  spec.homepage      = "https://github.com/searls/emoruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
