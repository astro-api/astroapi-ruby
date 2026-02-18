# frozen_string_literal: true

RSpec.describe 'Enhanced API' do
  include_context 'api client'

  describe '#get_global_analysis' do
    it 'returns global analysis' do
      stub_unless_live(:post, '/api/v3/enhanced/global-analysis', body: { data: { analysis: {} } })
      result = client.enhanced.get_global_analysis({ date: '2024-01-01' })
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_personal_analysis' do
    it 'returns personal analysis' do
      stub_unless_live(:post, '/api/v3/enhanced/personal-analysis', body: { data: { analysis: {} } })
      result = client.enhanced.get_personal_analysis(valid_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_global_analysis_chart' do
    it 'returns global analysis with chart' do
      stub_unless_live(:post, '/api/v3/enhanced_charts/global-analysis', body: { data: { chart: {} } })
      result = client.enhanced.get_global_analysis_chart({ date: '2024-01-01' })
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_personal_analysis_chart' do
    it 'returns personal analysis with chart' do
      stub_unless_live(:post, '/api/v3/enhanced_charts/personal-analysis', body: { data: { chart: {} } })
      result = client.enhanced.get_personal_analysis_chart(valid_request)
      expect(result).to be_a(Hash)
    end
  end
end
