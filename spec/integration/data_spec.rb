# frozen_string_literal: true

RSpec.describe 'Data API' do
  include_context 'api client'

  describe '#get_positions' do
    it 'returns planetary positions' do
      stub_unless_live(:post, '/api/v3/data/positions', body: { data: { sun: { name: 'Sun' } } })
      result = client.data.get_positions(valid_request)
      expect(result).to be_a(Hash)
      expect(result).not_to be_empty if live_mode?
    end
  end

  describe '#get_enhanced_positions' do
    it 'returns enhanced positions' do
      stub_unless_live(:post, '/api/v3/data/positions/enhanced', body: { data: { sun: { name: 'Sun' } } })
      result = client.data.get_enhanced_positions(valid_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_global_positions' do
    it 'returns global positions' do
      stub_unless_live(:post, '/api/v3/data/global-positions', body: { data: { sun: { name: 'Sun' } } })
      result = client.data.get_global_positions(year: 2024, month: 6, day: 15)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_aspects' do
    it 'returns aspects' do
      stub_unless_live(:post, '/api/v3/data/aspects', body: { data: { aspects: [] } })
      result = client.data.get_aspects(valid_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_enhanced_aspects' do
    it 'returns enhanced aspects' do
      stub_unless_live(:post, '/api/v3/data/aspects/enhanced', body: { data: { aspects: [] } })
      result = client.data.get_enhanced_aspects(valid_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_house_cusps' do
    it 'returns house cusps' do
      stub_unless_live(:post, '/api/v3/data/house-cusps', body: { data: { cusps: [] } })
      result = client.data.get_house_cusps(valid_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_lunar_metrics' do
    it 'returns lunar metrics' do
      stub_unless_live(:post, '/api/v3/data/lunar-metrics', body: { data: { phase: 'full' } })
      result = client.data.get_lunar_metrics(valid_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_enhanced_lunar_metrics' do
    it 'returns enhanced lunar metrics' do
      stub_unless_live(:post, '/api/v3/data/lunar-metrics/enhanced', body: { data: { phase: 'full' } })
      result = client.data.get_enhanced_lunar_metrics(valid_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_current_moment' do
    it 'returns current moment data' do
      stub_unless_live(:get, '/api/v3/data/now', body: { data: { sun: { name: 'Sun' } } })
      result = client.data.get_current_moment
      expect(result).to be_a(Hash)
      expect(result).not_to be_empty if live_mode?
    end
  end
end
