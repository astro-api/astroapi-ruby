# frozen_string_literal: true

RSpec.describe 'Palmistry API' do
  include_context 'api client'

  let(:palmistry_request) { { image_url: 'https://example.com/palm.jpg' } }

  describe '#analyze' do
    it 'returns palm analysis' do
      stub_unless_live(:post, '/api/v3/palmistry/analysis', body: { data: { analysis: {} } })
      expect_no_api_error do
        result = client.palmistry.analyze(palmistry_request)
        expect(result).to be_a(Hash)
      end
    end
  end

  describe '#get_reading' do
    it 'returns palm reading' do
      stub_unless_live(:post, '/api/v3/palmistry/reading', body: { data: { reading: {} } })
      expect_no_api_error do
        result = client.palmistry.get_reading(palmistry_request)
        expect(result).to be_a(Hash)
      end
    end
  end

  describe '#get_astro_integration' do
    it 'returns astro integration' do
      stub_unless_live(:post, '/api/v3/palmistry/astro', body: { data: { integration: {} } })
      expect_no_api_error do
        result = client.palmistry.get_astro_integration(palmistry_request)
        expect(result).to be_a(Hash)
      end
    end
  end

  describe '#get_compatibility' do
    it 'returns compatibility' do
      stub_unless_live(:post, '/api/v3/palmistry/compatibility', body: { data: { score: 75 } })
      expect_no_api_error do
        request = { palm_a_url: 'https://example.com/palm1.jpg', palm_b_url: 'https://example.com/palm2.jpg' }
        result = client.palmistry.get_compatibility(request)
        expect(result).to be_a(Hash)
      end
    end
  end
end
