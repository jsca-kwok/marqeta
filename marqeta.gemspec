# frozen_string_literal: true

require_relative 'lib/marqeta/version'

Gem::Specification.new do |spec|
  spec.name          = 'marqeta'
  spec.version       = Marqeta::VERSION
  spec.authors       = ['Marcelo Barreto']
  spec.email         = ['marcelobarretojunior@gmail.com']

  spec.summary       = 'Ruby API client for Marqeta'
  spec.homepage      = 'https://github.com/marcelobarreto/marqeta'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.4')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = 'https://github.com/marcelobarreto/marqeta/tree/main/CHANGELOG.md'

  spec.add_dependency 'dry-configurable'
  spec.add_dependency 'dry-struct'
  spec.add_dependency 'dry-types'

  spec.add_development_dependency 'dotenv', '~> 2.7.6'
  spec.add_development_dependency 'pry', '>= 0.14.0'
  spec.add_development_dependency 'rake', '>= 13.0'
  spec.add_development_dependency 'rspec', '>= 3.10'
  spec.add_development_dependency 'rubocop', '>= 1.12.0'
  spec.add_development_dependency 'rubocop-rake'
  spec.add_development_dependency 'rubocop-rspec'
end
