# frozen_string_literal: true

RSpec.describe Marqeta::Types::Webhook do
  describe 'attributes' do
    subject { described_class }

    it { is_expected.to have_attribute(:token) }
    it { is_expected.to have_attribute(:name) }
    it { is_expected.to have_attribute(:active) }
    it { is_expected.to have_attribute(:events) }
  end
end

# frozen_string_literal: true

RSpec.describe Marqeta::Types::WebhookConfig do
  describe 'attributes' do
    subject { described_class }

    it { is_expected.to have_attribute(:url) }
    it { is_expected.to have_attribute(:basic_auth_username) }
    it { is_expected.to have_attribute(:basic_auth_password) }
    it { is_expected.to have_attribute(:secret) }
    it { is_expected.to have_attribute(:custom_header) }
  end
end
