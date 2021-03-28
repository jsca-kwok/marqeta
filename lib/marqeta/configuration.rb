# frozen_string_literal: true

module Marqeta
  module Configuration
    extend Dry::Configurable

    setting(:base_url, ENV['MARQETA_BASE_URL'])
    setting(:username, ENV['MARQETA_USERNAME'])
    setting(:password, ENV['MARQETA_PASSWORD'])
    setting(:locale, 'en')
  end
end
