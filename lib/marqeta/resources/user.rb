# frozen_string_literal: true

require 'marqeta/resources/base'
require 'marqeta/types/user_type'

module Marqeta
  module Resources
    class User < Base
      set_path '/users'
      set_has_collection true
      set_type Marqeta::Types::UserType
    end
  end
end
