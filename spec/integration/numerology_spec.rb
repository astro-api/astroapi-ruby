# frozen_string_literal: true

RSpec.describe 'Numerology API' do
  include_context 'api client'

  let(:numerology_request) do
    {
      subject: {
        name: 'John Doe',
        birth_data: { year: 1990, month: 5, day: 11 }
      }
    }
  end

  describe '#get_core_numbers' do
    it 'returns core numbers' do
      stub_unless_live(:post, '/api/v3/numerology/core-numbers', body: { data: { life_path: 7 } })
      result = client.numerology.get_core_numbers(numerology_request)
      expect(result).to be_a(Hash)
      expect(result).not_to be_empty if live_mode?
    end
  end

  describe '#get_comprehensive_report' do
    it 'returns comprehensive report' do
      stub_unless_live(:post, '/api/v3/numerology/comprehensive', body: { data: { report: 'text' } })
      result = client.numerology.get_comprehensive_report(numerology_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#analyze_compatibility' do
    it 'returns compatibility analysis' do
      stub_unless_live(:post, '/api/v3/numerology/compatibility', body: { data: { score: 85 } })
      result = client.numerology.analyze_compatibility(numerology_request)
      expect(result).to be_a(Hash)
    end
  end
end
