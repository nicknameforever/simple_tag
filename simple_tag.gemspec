# -*- encoding: utf-8 -*-
require File.expand_path('../lib/simple_tag/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Alexey"]
  gem.email         = "nickname4ever@googlemail.com"
  gem.description   = ""
  gem.summary       = "Lightweight tagging for Rails 3"
  gem.homepage      = "https://github.com/nicknameforever/simple_tag"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "simple_tag"
  gem.require_paths = ["lib"]
  gem.version       = SimpleTag::VERSION
end
