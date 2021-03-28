# frozen_string_literal: true

require 'marqeta/schemas/base_schema'
require 'marqeta/types'

module Marqeta
  module Schemas
    class User < BaseSchema
      params do
        required(:token).value(:string)
        required(:active).value(Bool.default(true))
        required(:notes).value(:string)
        required(:ip_address).value(:string)
        required(:password).value(:string)
        required(:phone).value(:string)
        required(:metadata).value(:hash)
        required(:gender).value(:string)
        required(:first_name).value(:string)
        required(:middle_name).value(:string)
        required(:last_name).value(:string)
        required(:email).value(Types::Email)
        required(:account_holder_group_token).value(:string)
        required(:identifications).value(Array.of(String).optional)
        required(:honorific).value(:string)
        required(:address1).value(:string)
        required(:address2).value(:string)
        required(:city).value(:string)
        required(:state).value(:string)
        required(:country).value(:string)
        required(:birth_date).value(:string)
        required(:corporate_card_holder).value(Bool.optional)
        required(:ssn).value(:string)
        required(:passport_number).value(:string)
        required(:passport_expiration_date).value(:string)
        required(:id_card_number).value(:string)
        required(:id_card_expiration_date).value(:string)
        required(:nationality).value(:string)
        required(:company).value(:string)
        required(:postal_code).value(:string)
        required(:parent_token).value(:string)
        required(:uses_parent_account).value(Bool.optional)
        required(:created_time).value(:string)
        required(:last_modified_time).value(:string)
        required(:status).value(Types::UserStatuses)
      end
    end
  end
end
