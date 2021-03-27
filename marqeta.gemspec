# frozen_string_literal: true

require_relative 'lib/marqeta/version'

Gem::Specification.new do |spec|
  spec.name          = 'marqeta'
  spec.version       = Marqeta::VERSION
  spec.authors       = ['Marcelo Barreto']
  spec.email         = ['marcelobarretojunior@gmail.com']

  spec.summary       = 'Ruby API client for Marqeta'
  spec.homepage      = 'https://github.com/marcelobarreto/marqeta'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.5')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = 'https://github.com/marcelobarreto/marqeta/tree/main/CHANGELOG.md'

  spec.add_dependency 'dry-configurable', '>= 0.12.1'
  spec.add_dependency 'dry-struct', '>= 1.4.0'
  spec.add_dependency 'dry-types', '>= 1.5.1'
  spec.add_dependency 'dry-validation', '>= 1.6.0'

  spec.add_development_dependency 'dotenv', '~> 2.7.6'
  spec.add_development_dependency 'pry', '>= 0.14.0'
  spec.add_development_dependency 'rake', '>= 13.0'
  spec.add_development_dependency 'rspec', '>= 3.10'
  spec.add_development_dependency 'rubocop', '>= 1.12.0'
  spec.add_development_dependency 'simplecov', '~> 0.21.2'
end
