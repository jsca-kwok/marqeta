# frozen_string_literal: true

require 'marqeta/base_resource'
require 'marqeta/schemas/user'

module Marqeta
  class User < BaseResource
    set_path '/users'
    set_has_collection true
    set_schema Marqeta::Schemas::User
  end
end
