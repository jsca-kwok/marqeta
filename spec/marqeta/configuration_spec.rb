# frozen_string_literal: true

RSpec.describe Marqeta::Configuration do
  describe 'Allowed configurations' do
    subject { described_class.config }

    it { is_expected.to respond_to(:base_url=) }
    it { is_expected.to respond_to(:base_url) }
    it { is_expected.to respond_to(:username=) }
    it { is_expected.to respond_to(:username) }
    it { is_expected.to respond_to(:password=) }
    it { is_expected.to respond_to(:password) }

    context 'When params are not provided' do
      it 'Gets default from the environment variables' do
        expect(subject.base_url).to eq(ENV['MARQETA_BASE_URL'])
        expect(subject.username).to eq(ENV['MARQETA_USERNAME'])
        expect(subject.password).to eq(ENV['MARQETA_PASSWORD'])
      end
    end
  end
end
