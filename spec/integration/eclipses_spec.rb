# frozen_string_literal: true

RSpec.describe 'Eclipses API' do
  include_context 'api client'

  describe '#get_upcoming' do
    it 'returns upcoming eclipses' do
      stub_unless_live(:get, '/api/v3/eclipses/upcoming', body: { data: [{ type: 'solar' }] })
      result = client.eclipses.get_upcoming
      expect(result).to be_a(Array).or be_a(Hash)
    end
  end

  describe '#check_natal_impact' do
    it 'returns natal impact' do
      stub_unless_live(:post, '/api/v3/eclipses/natal-check', body: { data: { impact: 'moderate' } })
      result = client.eclipses.check_natal_impact(valid_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_interpretation' do
    it 'returns eclipse interpretation' do
      stub_unless_live(:post, '/api/v3/eclipses/interpretation', body: { data: { interpretation: 'text' } })
      expect_no_api_error do
        request = valid_request.merge(eclipse_id: '2024Apr08T')
        result = client.eclipses.get_interpretation(request)
        expect(result).to be_a(Hash)
      end
    end
  end
end
