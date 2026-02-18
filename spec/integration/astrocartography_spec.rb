# frozen_string_literal: true

RSpec.describe 'Astrocartography API' do
  include_context 'api client'

  describe '#get_lines' do
    it 'returns astrocartography lines' do
      stub_unless_live(:post, '/api/v3/astrocartography/lines', body: { data: { lines: [] } })
      result = client.astrocartography.get_lines(valid_request)
      expect(result).to be_a(Hash)
      expect(result).not_to be_empty if live_mode?
    end
  end

  describe '#generate_map' do
    it 'returns map data' do
      stub_unless_live(:post, '/api/v3/astrocartography/map', body: { data: { map: 'data' } })
      result = client.astrocartography.generate_map(valid_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#generate_paran_map' do
    it 'returns paran map' do
      stub_unless_live(:post, '/api/v3/astrocartography/paran-map', body: { data: { map: 'data' } })
      result = client.astrocartography.generate_paran_map(valid_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#analyze_location' do
    it 'returns location analysis' do
      stub_unless_live(:post, '/api/v3/astrocartography/location-analysis', body: { data: { analysis: {} } })
      request = valid_request.merge(location: { city: 'New York', country_code: 'US' })
      result = client.astrocartography.analyze_location(request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#compare_locations' do
    it 'returns location comparison' do
      stub_unless_live(:post, '/api/v3/astrocartography/compare-locations', body: { data: { comparison: {} } })
      request = valid_request.merge(
        locations: [
          { city: 'New York', country_code: 'US' },
          { city: 'London', country_code: 'GB' }
        ]
      )
      result = client.astrocartography.compare_locations(request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#find_power_zones' do
    it 'returns power zones' do
      stub_unless_live(:post, '/api/v3/astrocartography/power-zones', body: { data: { zones: [] } })
      result = client.astrocartography.find_power_zones(valid_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#search_locations' do
    it 'returns matching locations' do
      stub_unless_live(:post, '/api/v3/astrocartography/search-locations', body: { data: { locations: [] } })
      request = valid_request.merge(criteria: { themes: ['career'] })
      result = client.astrocartography.search_locations(request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#generate_relocation_chart' do
    it 'returns relocation chart' do
      stub_unless_live(:post, '/api/v3/astrocartography/relocation-chart', body: { data: { chart: {} } })
      request = valid_request.merge(location: { city: 'New York', country_code: 'US' })
      result = client.astrocartography.generate_relocation_chart(request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_line_meanings' do
    it 'returns line meanings' do
      stub_unless_live(:get, '/api/v3/astrocartography/line-meanings', body: { data: [{ line: 'Sun MC' }] })
      result = client.astrocartography.get_line_meanings
      expect(result).to be_a(Array).or be_a(Hash)
    end
  end

  describe '#get_supported_features' do
    it 'returns supported features' do
      stub_unless_live(:get, '/api/v3/astrocartography/supported-features', body: { data: { features: [] } })
      result = client.astrocartography.get_supported_features
      expect(result).to be_a(Array).or be_a(Hash)
    end
  end

  describe '#calculate_astrodynes' do
    it 'returns astrodynes' do
      stub_unless_live(:post, '/api/v3/astrocartography/astrodynes', body: { data: { astrodynes: {} } })
      result = client.astrocartography.calculate_astrodynes(valid_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#compare_astrodynes' do
    it 'returns astrodyne comparison' do
      stub_unless_live(:post, '/api/v3/astrocartography/astrodynes/compare', body: { data: { comparison: {} } })
      request = valid_request.merge(
        locations: [
          { city: 'New York', country_code: 'US' },
          { city: 'London', country_code: 'GB' }
        ]
      )
      result = client.astrocartography.compare_astrodynes(request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#render_map' do
    it 'returns rendered map' do
      stub_unless_live(:post, '/api/v3/astrocartography/render', body: { data: { image: 'data' } })
      expect_no_api_error do
        result = client.astrocartography.render_map(valid_request)
        expect(result).to be_a(Hash).or be_a(String)
      end
    end
  end
end
