# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ltree_rails/version'

Gem::Specification.new do |spec|
  spec.name          = 'ltree_rails'
  spec.version       = LtreeRails::VERSION
  spec.authors       = ['Vladimir Tikhonov']
  spec.email         = ['vladimir@tikhonov.by']

  spec.summary       = %q{Easily organize your rails models in hierarchical structures with PostgreSQL ltree datatype}
  spec.homepage      = 'https://github.com/vladimir-tikhonov/ltree_rail'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'activerecord', '>= 4.0.0'

  spec.add_development_dependency 'bundler', '>= 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.2'
  spec.add_development_dependency 'coveralls'
  spec.add_development_dependency 'appraisal'
end
