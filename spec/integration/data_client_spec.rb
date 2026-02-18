# frozen_string_literal: true

RSpec.describe 'Data Client Integration' do
  let(:client) { Astroapi::Client.new(api_key: 'test-api-key') }

  let(:valid_request) do
    {
      subject: {
        birth_data: {
          year: 1990,
          month: 5,
          day: 11,
          hour: 14,
          minute: 30,
          city: 'London',
          country_code: 'GB'
        }
      }
    }
  end

  describe '#get_positions' do
    it 'returns planetary positions' do
      stub_positions_request

      result = client.data.get_positions(valid_request)

      expect(result).to be_a(Hash)
      expect(result['sun']).to be_a(Hash)
      expect(result['sun']['name']).to eq('Sun')
      expect(result['sun']['sign']).to eq('Taurus')
    end

    it 'includes Authorization header' do
      request = stub_positions_request

      client.data.get_positions(valid_request)

      expect(request).to have_been_made.once
      expect(request.with(headers: { 'Authorization' => 'Bearer test-api-key' })).to have_been_made
    end

    it 'unwraps data envelope' do
      stub_api_request(:post, '/api/v3/data/positions',
                       body: { data: { sun: { name: 'Sun' } } })

      result = client.data.get_positions(valid_request)

      expect(result).to eq({ 'sun' => { 'name' => 'Sun' } })
    end

    it 'raises ValidationError for invalid subject' do
      invalid_request = { subject: { birth_data: {} } }

      expect { client.data.get_positions(invalid_request) }
        .to raise_error(Astroapi::ValidationError)
    end

    it 'raises ClientError for 4xx responses' do
      stub_api_request(:post, '/api/v3/data/positions', status: 404, body: { error: 'Not found' })

      expect { client.data.get_positions(valid_request) }
        .to raise_error(Astroapi::ClientError)
    end

    it 'raises ServerError for 5xx responses' do
      stub_api_request(:post, '/api/v3/data/positions', status: 500, body: { error: 'Server error' })

      expect { client.data.get_positions(valid_request) }
        .to raise_error(Astroapi::ServerError)
    end
  end

  describe '#get_current_moment' do
    it 'returns current planetary positions' do
      stub_api_request(:get, '/api/v3/data/now',
                       body: { data: { sun: { name: 'Sun', longitude: 120.5 } } })

      result = client.data.get_current_moment

      expect(result).to be_a(Hash)
      expect(result['sun']).to be_a(Hash)
      expect(result['sun']['name']).to eq('Sun')
    end
  end
end
