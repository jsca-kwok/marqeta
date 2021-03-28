# frozen_string_literal: true

require 'marqeta/base_resource'
require 'marqeta/schemas/webhook'

module Marqeta
  class WebhookConfig < BaseResource
    set_schema Marqeta::Schemas::WebhookConfig
  end

  class Webhook < BaseResource
    set_path '/webhooks'
    set_has_collection true
    set_schema Marqeta::Schemas::Webhook
    set_schema_for :config, WebhookConfig
  end
end
