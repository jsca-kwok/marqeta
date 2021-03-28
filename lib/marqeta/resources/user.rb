# frozen_string_literal: true

require 'marqeta/resources/base'
require 'marqeta/types/user'
require 'pry'

module Marqeta
  module Resources
    class User < Base
      set_path '/users'
      set_has_collection true
      set_type Marqeta::Types::User

      # update_payload do |attributes|
      #   attributes.delete(:token)
      #   attributes.delete(:created_time)
      #   attributes.delete(:last_modified_time)
      #   attributes.delete(:status)

      #   attributes
      # end
    end
  end
end
