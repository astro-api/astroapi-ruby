# frozen_string_literal: true

RSpec.describe Astroapi::Error do
  describe '#client_error?' do
    it 'returns true for 4xx status codes' do
      error = described_class.new('Bad request', status_code: 400)
      expect(error.client_error?).to be true
    end

    it 'returns false for 5xx status codes' do
      error = described_class.new('Server error', status_code: 500)
      expect(error.client_error?).to be false
    end

    it 'returns false when status_code is nil' do
      error = described_class.new('Unknown error')
      expect(error.client_error?).to be false
    end
  end

  describe '#server_error?' do
    it 'returns true for 5xx status codes' do
      error = described_class.new('Server error', status_code: 500)
      expect(error.server_error?).to be true
    end

    it 'returns false for 4xx status codes' do
      error = described_class.new('Bad request', status_code: 400)
      expect(error.server_error?).to be false
    end

    it 'returns false when status_code is nil' do
      error = described_class.new('Unknown error')
      expect(error.server_error?).to be false
    end
  end

  describe '.from_faraday_error' do
    it 'converts TimeoutError' do
      faraday_error = Faraday::TimeoutError.new('timeout')
      error = described_class.from_faraday_error(faraday_error)

      expect(error).to be_a(Astroapi::TimeoutError)
      expect(error.message).to eq('timeout')
    end

    it 'converts ConnectionFailed' do
      faraday_error = Faraday::ConnectionFailed.new('connection failed')
      error = described_class.from_faraday_error(faraday_error)

      expect(error).to be_a(Astroapi::ConnectionError)
      expect(error.message).to eq('connection failed')
    end

    it 'converts ClientError with 4xx status' do
      response = { status: 404, body: 'Not found' }
      faraday_error = Faraday::ResourceNotFound.new('not found', response)
      error = described_class.from_faraday_error(faraday_error)

      expect(error).to be_a(Astroapi::ClientError)
      expect(error.status_code).to eq(404)
    end

    it 'converts ClientError with 5xx status' do
      response = { status: 500, body: 'Server error' }
      faraday_error = Faraday::ServerError.new('server error', response)
      error = described_class.from_faraday_error(faraday_error)

      expect(error).to be_a(Astroapi::ServerError)
      expect(error.status_code).to eq(500)
    end
  end
end
