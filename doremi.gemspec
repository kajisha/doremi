# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'doremi/version'

Gem::Specification.new do |spec|
  spec.name          = 'doremi'
  spec.version       = Doremi::VERSION
  spec.authors       = ['kajisha']
  spec.email         = ['kajisha@gmail.com']

  spec.summary       = %q{postgresql extended operator}
  spec.description   = %q{postgresql extended operators}
  spec.homepage      = 'https://github.com/kajisha/doremi'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'activerecord', '>= 4.2'
  spec.add_dependency 'pg'

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'database_cleaner'
end
