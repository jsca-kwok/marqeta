# frozen_string_literal: true

RSpec.describe Marqeta::Types::SharedTypes do
  describe 'attributes' do
    subject { described_class }

    it { is_expected.to have_const(:REGEX_PASSWORD) }
    it { is_expected.to have_const(:UserStatuses) }
    it { is_expected.to have_const(:Email) }
    it { is_expected.to have_const(:SafePassword) }
  end

  describe 'safe password regex' do
    subject { described_class.const_get(:REGEX_PASSWORD) }

    context 'when it is valid' do
      it 'is truthy' do
        password = Faker::Internet.password({
          min_length: 20, max_length: 50,
          mix_case: true, special_characters: true
        })

        expect(password.match(subject)).to be_truthy
      end
    end

    context 'when it is not valid' do
      it 'is falsy' do
        password = Faker::Internet.password({
          min_length: 10, max_length: 19,
          mix_case: true, special_characters: true
        })

        expect(password.match(subject)).to be_falsy
      end
    end
  end

  describe 'Email schema' do
    subject { described_class.const_get(:Email) }

    context 'when it is valid' do
      it 'is truthy' do
        expect(subject[Faker::Internet.email]).to be_truthy
      end
    end

    context 'when it is not valid' do
      it 'is falsy' do
        expect {
          subject['random.com']
        }.to raise_error(Dry::Types::ConstraintError)

        expect {
          subject['random@com']
        }.to raise_error(Dry::Types::ConstraintError)
      end
    end
  end
end
