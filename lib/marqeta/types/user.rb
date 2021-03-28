# frozen_string_literal: true

require 'marqeta/types/base_type'
require 'marqeta/types/shared_types'

module Marqeta
  module Types
    class User < BaseType
      attribute :token, String.optional
      attribute :active, Bool.default(true)
      attribute :notes, String.optional
      attribute :ip_address, String.optional
      attribute :password, String.optional
      attribute :phone, String.optional
      attribute :metadata, Hash
      attribute :gender, String.optional
      attribute :first_name, String.optional
      attribute :middle_name, String.optional
      attribute :last_name, String.optional
      attribute :email, SharedTypes::Email
      attribute :account_holder_group_token, String.optional
      attribute :identifications, Array.of(String).optional
      attribute :honorific, String.optional
      attribute :address1, String.optional
      attribute :address2, String.optional
      attribute :city, String.optional
      attribute :state, String.optional
      attribute :country, String.optional
      attribute :birth_date, String.optional
      attribute :corporate_card_holder, Bool.optional
      attribute :ssn, String.optional
      attribute :passport_number, String.optional
      attribute :passport_expiration_date, String.optional
      attribute :id_card_number, String.optional
      attribute :id_card_expiration_date, String.optional
      attribute :nationality, String.optional
      attribute :company, String.optional
      attribute :postal_code, String.optional
      attribute :parent_token, String.optional
      attribute :uses_parent_account, Bool.optional
      attribute :created_time, String.optional
      attribute :last_modified_time, String.optional
      attribute :status, SharedTypes::UserStatuses
    end
  end
end
