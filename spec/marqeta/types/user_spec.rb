# frozen_string_literal: true

RSpec.describe Marqeta::Types::User do
  Types = Dry::Types()

  describe 'attributes' do
    subject { described_class }

    it { is_expected.to have_attribute(:token) }
    it { is_expected.to have_attribute(:active) }
    it { is_expected.to have_attribute(:notes) }
    it { is_expected.to have_attribute(:ip_address) }
    it { is_expected.to have_attribute(:password) }
    it { is_expected.to have_attribute(:phone) }
    it { is_expected.to have_attribute(:metadata) }
    it { is_expected.to have_attribute(:gender) }
    it { is_expected.to have_attribute(:first_name) }
    it { is_expected.to have_attribute(:middle_name) }
    it { is_expected.to have_attribute(:last_name) }
    it { is_expected.to have_attribute(:email) }
    it { is_expected.to have_attribute(:account_holder_group_token) }
    it { is_expected.to have_attribute(:identifications) }
    it { is_expected.to have_attribute(:honorific) }
    it { is_expected.to have_attribute(:address1) }
    it { is_expected.to have_attribute(:address2) }
    it { is_expected.to have_attribute(:city) }
    it { is_expected.to have_attribute(:state) }
    it { is_expected.to have_attribute(:country) }
    it { is_expected.to have_attribute(:birth_date) }
    it { is_expected.to have_attribute(:corporate_card_holder) }
    it { is_expected.to have_attribute(:ssn) }
    it { is_expected.to have_attribute(:passport_number) }
    it { is_expected.to have_attribute(:passport_expiration_date) }
    it { is_expected.to have_attribute(:id_card_number) }
    it { is_expected.to have_attribute(:id_card_expiration_date) }
    it { is_expected.to have_attribute(:nationality) }
    it { is_expected.to have_attribute(:company) }
    it { is_expected.to have_attribute(:postal_code) }
    it { is_expected.to have_attribute(:parent_token) }
    it { is_expected.to have_attribute(:uses_parent_account) }
    it { is_expected.to have_attribute(:created_time) }
    it { is_expected.to have_attribute(:last_modified_time) }
    it { is_expected.to have_attribute(:status) }
  end
end
