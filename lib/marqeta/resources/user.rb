# frozen_string_literal: true

require 'marqeta/resources/base'
require 'marqeta/validators/user_validator'

module Marqeta
  module Resources
    class User < Base
      set_path '/users'
      set_has_collection true
      set_fields %i[
        token active notes ip_address password phone metadata
        gender first_name middle_name last_name email account_holder_group_token
        identifications honorific address1 address2 city state country
        birth_date corporate_card_holder ssn passport_number passport_expiration_date
        id_card_number id_card_expiration_date nationality company postal_code
        parent_token uses_parent_account
      ]
      set_validator Validators::UserValidator
    end
  end
end
