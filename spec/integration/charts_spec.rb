# frozen_string_literal: true

RSpec.describe 'Charts API' do
  include_context 'api client'

  describe '#get_natal_chart' do
    it 'returns natal chart' do
      stub_unless_live(:post, '/api/v3/charts/natal', body: { data: { planets: {} } })
      result = client.charts.get_natal_chart(valid_request)
      expect(result).to be_a(Hash)
      expect(result).not_to be_empty if live_mode?
    end
  end

  describe '#get_composite_chart' do
    it 'returns composite chart' do
      stub_unless_live(:post, '/api/v3/charts/composite', body: { data: { planets: {} } })
      result = client.charts.get_composite_chart(two_subjects_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_synastry_chart' do
    it 'returns synastry chart' do
      stub_unless_live(:post, '/api/v3/charts/synastry', body: { data: { planets: {} } })
      result = client.charts.get_synastry_chart(two_subjects_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_transit_chart' do
    it 'returns transit chart' do
      stub_unless_live(:post, '/api/v3/charts/transit', body: { data: { transits: {} } })
      result = client.charts.get_transit_chart(transit_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_solar_return_chart' do
    it 'returns solar return chart' do
      stub_unless_live(:post, '/api/v3/charts/solar-return', body: { data: { planets: {} } })
      result = client.charts.get_solar_return_chart(return_year_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_lunar_return_chart' do
    it 'returns lunar return chart' do
      stub_unless_live(:post, '/api/v3/charts/lunar-return', body: { data: { planets: {} } })
      result = client.charts.get_lunar_return_chart(return_date_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_solar_return_transits' do
    it 'returns solar return transits' do
      stub_unless_live(:post, '/api/v3/charts/solar-return-transits', body: { data: { events: [] } })
      expect_no_api_error do
        result = client.charts.get_solar_return_transits(return_year_range_request)
        expect(result).to be_a(Hash)
      end
    end
  end

  describe '#get_lunar_return_transits' do
    it 'returns lunar return transits' do
      stub_unless_live(:post, '/api/v3/charts/lunar-return-transits', body: { data: { events: [] } })
      expect_no_api_error do
        result = client.charts.get_lunar_return_transits(return_date_range_request)
        expect(result).to be_a(Hash)
      end
    end
  end

  describe '#get_progressions' do
    it 'returns progressions' do
      stub_unless_live(:post, '/api/v3/charts/progressions', body: { data: { planets: {} } })
      result = client.charts.get_progressions(target_date_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_directions' do
    it 'returns directions' do
      stub_unless_live(:post, '/api/v3/charts/directions', body: { data: { planets: {} } })
      result = client.charts.get_directions(target_date_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_natal_transits' do
    it 'returns natal transits' do
      stub_unless_live(:post, '/api/v3/charts/natal-transits', body: { data: { events: [] } })
      result = client.charts.get_natal_transits(transit_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_venus_return_chart' do
    it 'returns venus return chart' do
      stub_unless_live(:post, '/api/v3/charts/venus-return', body: { data: { planets: {} } })
      result = client.charts.get_venus_return_chart(return_date_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_venus_return_transits' do
    it 'returns venus return transits' do
      stub_unless_live(:post, '/api/v3/charts/venus-return-transits', body: { data: { events: [] } })
      expect_no_api_error do
        result = client.charts.get_venus_return_transits(return_date_range_request)
        expect(result).to be_a(Hash)
      end
    end
  end
end
