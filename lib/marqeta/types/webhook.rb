# frozen_string_literal: true

require 'marqeta/types/base_type'
require 'marqeta/types/shared_types'

module Marqeta
  module Types
    class WebhookConfig < BaseType
      attribute :url, String.constrained(format: %r{^https://})
      attribute :basic_auth_username, String.constrained(max_size: 50)
      attribute :basic_auth_password, SharedTypes::SafePassword
      attribute :secret, SharedTypes::SafePassword
      attribute :custom_header, Hash.default({}.freeze)
    end

    class Webhook < BaseType
      attribute :token, String
      attribute :name, String
      attribute :active, Bool
      attribute :events, Array.of(String)
    end
  end
end
