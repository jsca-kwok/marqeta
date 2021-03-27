# frozen_string_literal: true

require 'marqeta/resources/base'
require 'marqeta/types/webhook_type'

module Marqeta
  module Resources
    class WebhookConfig < Base
      set_type Marqeta::Types::WebhookConfigType
    end

    class Webhook < Base
      set_path '/webhooks'
      set_has_collection true
      set_type Marqeta::Types::WebhookType
      set_type_for :config, Resources::WebhookConfig
    end
  end
end
