# frozen_string_literal: true

require 'marqeta/resources/base'
require 'marqeta/types/user'

module Marqeta
  module Resources
    class User < Base
      set_path '/users'
      set_has_collection true
      set_type Marqeta::Types::User
    end
  end
end
