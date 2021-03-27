# frozen_string_literal: true

RSpec.describe Marqeta::HTTP do
  describe 'Methods' do
    subject { described_class }

    describe '.basic_auth' do
      it 'returns basic username and password' do
        expect(subject.basic_auth).to eq([Marqeta::Configuration.config.username, Marqeta::Configuration.config.password])
      end
    end

    describe '.handle_response' do
      subject { described_class.handle_response(fake_response) }

      context 'when response http status is equal to 200 or 201' do
        let(:fake_response) { OpenStruct.new(code: "201", body: { success: true }.to_json) }

        it { is_expected.to eq({ "success" => true }) }
      end

      context 'when response http status is equal to 400' do
        let(:fake_response) { OpenStruct.new(code: "400", body: { success: false }.to_json) }

        it { expect { subject }.to raise_error(described_class::BadRequestError) }
      end

      context 'when response http status is equal to 500' do
        let(:fake_response) { OpenStruct.new(code: "500", body: { success: false }.to_json) }

        it { expect { subject }.to raise_error(described_class::ServerError) }
      end

      context 'when there is an error in the json parsing' do
        let(:fake_response) { OpenStruct.new(code: 201, body: "") }

        it { expect { subject }.to raise_error(described_class::ResponseParsingError) }
      end
    end
  end
end
