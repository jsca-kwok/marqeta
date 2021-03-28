# frozen_string_literal: true

require 'marqeta/base_resource'
require 'marqeta/schemas/ping'

module Marqeta
  class Ping < BaseResource
    set_path '/ping'
    set_schema Marqeta::Schemas::Ping
  end
end
