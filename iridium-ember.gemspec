# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'iridium/ember/version'

Gem::Specification.new do |gem|
  gem.name          = "iridium-ember"
  gem.version       = Iridium::Ember::VERSION
  gem.authors       = ["Adam Hawkins"]
  gem.email         = ["me@brodcastingdam.com"]
  gem.description   = %q{Ember integration for Iridium}
  gem.summary       = %q{}
  gem.homepage      = "https://github.com/radiumsoftware/iridium-ember"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rake"
  gem.add_development_dependency "simplecov"
end
