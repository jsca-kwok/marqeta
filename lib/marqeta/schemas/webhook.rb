# frozen_string_literal: true

require 'marqeta/schemas/base_schema'
require 'marqeta/types'

module Marqeta
  module Schemas
    class Webhook < BaseSchema
      schema do
        required(:token).value(String.optional)
        required(:name).value(:string)
        required(:active).value(Bool)
        required(:events).value(Array.of(String))
      end
    end

    class WebhookConfig < BaseSchema
      params do
        required(:url).filled(Types::HttpsUrl)
        required(:basic_auth_username).filled(String.constrained(max_size: 50))
        required(:basic_auth_password).filled(Types::SafePassword)
        required(:secret).value(Types::SafePassword.optional)
        required(:custom_header).value(:hash)
      end
    end
  end
end
