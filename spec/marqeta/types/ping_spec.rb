# frozen_string_literal: true

RSpec.describe Marqeta::Types::Ping do
  describe 'attributes' do
    subject { described_class }

    it { is_expected.to have_attribute(:id) }
    it { is_expected.to have_attribute(:env) }
    it { is_expected.to have_attribute(:version) }
    it { is_expected.to have_attribute(:revision) }
    it { is_expected.to have_attribute(:timestamp) }
    it { is_expected.to have_attribute(:success) }
  end
end
