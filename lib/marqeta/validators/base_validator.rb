# frozen_string_literal: true

require 'marqeta/configuration'

module Marqeta
  module Validators
    class BaseValidator < Dry::Validation::Contract
      config.messages.default_locale = Marqeta::Configuration.config.locale
      config.messages.top_namespace = 'marqeta'
      config.messages.load_paths << 'config/locales/en.yml'
      config.messages.backend = :yaml
    end
  end
end
