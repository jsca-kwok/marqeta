# frozen_string_literal: true

require 'marqeta/types/base_type'

module Marqeta
  module Types
    class UserType < BaseType
      attribute :token, String
      attribute :active, String.default('')
      attribute :notes, String.default('')
      attribute :ip_address, String.default('')
      attribute :password, String.default('')
      attribute :phone, String.default('')
      attribute :metadata, String.default('')
      attribute :gender, String.default('')
      attribute :first_name, String.default('')
      attribute :middle_name, String.default('')
      attribute :last_name, String.default('')
      attribute :email, String.default('')
      attribute :account_holder_group_token, String.default('')
      attribute :identifications, String.default('')
      attribute :honorific, String.default('')
      attribute :address1, String.default('')
      attribute :address2, String.default('')
      attribute :city, String.default('')
      attribute :state, String.default('')
      attribute :country, String.default('')
      attribute :birth_date, String.default('')
      attribute :corporate_card_holder, String.default('')
      attribute :ssn, String.default('')
      attribute :passport_number, String.default('')
      attribute :passport_expiration_date, String.default('')
      attribute :id_card_number, String.default('')
      attribute :id_card_expiration_date, String.default('')
      attribute :nationality, String.default('')
      attribute :company, String.default('')
      attribute :postal_code, String.default('')
      attribute :parent_token, String.default('')
      attribute :uses_parent_account, String.default('')
    end
  end
end