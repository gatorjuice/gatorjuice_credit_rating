# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gatorjuice_credit_rating/version'

Gem::Specification.new do |spec|
  spec.name          = "gatorjuice_credit_rating"
  spec.version       = GatorjuiceCreditRating::VERSION
  spec.authors       = ["Jamie"]
  spec.email         = ["gatorjuice@gmail.com"]

  spec.summary       = "fake credit ranking"
  spec.description   = "gives a fake credit ranking"
  spec.homepage      = "https://github.com/gatorjuice/gatorjuice_credit_rating"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # specifying which ruby version 
  spec.required_ruby_version = '2.2.0'

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "3.4.0"
  spec.add_dependency "unirest", "1.1.2"
end
