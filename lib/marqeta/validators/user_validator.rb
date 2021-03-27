# frozen_string_literal: true

require 'marqeta/validators/base_validator'

module Marqeta
  module Validators
    class UserValidator < BaseValidator
      params do
        # token	string	required
        # active	boolean	required
        # notes	string	required
        # ip_address	string	required
        # password	string	required
        # phone	string	required
        # metadata	object	required
        # account_holder_group_token	string	required
        # identifications	array	required
        # honorific	string	required
        # gender	string	required
        # email	string	required
        # address1	string	required
        # address2	string	required
        # city	string	required
        # state	string	required
        # country	string	required
        # birth_date	string	required
        # corporate_card_holder	boolean	required
        # ssn	string	required
        # passport_number	string	required
        # passport_expiration_date	string	required
        # id_card_number	string	required
        # id_card_expiration_date	string	required
        # nationality	string	required
        # company	string	required
        # parent_token	string	required
        # uses_parent_account	boolean	required	Default is false
        # postal_code	string	required

        required(:email).maybe(:string)
        required(:first_name).maybe(:string)
        required(:middle_name).maybe(:string)
        required(:last_name).maybe(:string)
      end
    end
  end
end
