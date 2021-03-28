# frozen_string_literal: true

require 'marqeta/schemas/base_schema'

module Marqeta
  module Schemas
    class Ping < BaseSchema
      params do
        required(:id).value(String)
        required(:env).value(String)
        required(:version).value(String)
        required(:revision).value(String)
        required(:timestamp).value(String)
        required(:success).value(Bool)
      end
    end
  end
end
