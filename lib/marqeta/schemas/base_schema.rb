# frozen_string_literal: true

require 'marqeta/configuration'

module Marqeta
  module Schemas
    class BaseSchema < Dry::Validation::Contract
      include Dry::Types()

      config.messages.default_locale = Marqeta::Configuration.config.locale
      config.messages.top_namespace = 'marqeta'
    end
  end
end
