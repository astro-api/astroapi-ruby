# frozen_string_literal: true

RSpec.describe 'Fengshui API' do
  include_context 'api client'

  describe '#calculate_flying_stars_chart' do
    it 'returns flying stars chart' do
      stub_unless_live(:post, '/api/v3/fengshui/flying-stars/chart', body: { data: { chart: {} } })
      result = client.fengshui.calculate_flying_stars_chart({ facing_degrees: 180, period: 8 })
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_annual_flying_stars' do
    it 'returns annual flying stars' do
      stub_unless_live(:get, '/api/v3/fengshui/flying-stars/annual/2024', body: { data: { stars: {} } })
      result = client.fengshui.get_annual_flying_stars(2024)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_afflictions' do
    it 'returns afflictions' do
      stub_unless_live(:get, '/api/v3/fengshui/afflictions/2024', body: { data: { afflictions: [] } })
      result = client.fengshui.get_afflictions(2024)
      expect(result).to be_a(Hash).or be_a(Array)
    end
  end

  describe '#get_stars_glossary' do
    it 'returns stars glossary' do
      stub_unless_live(:get, '/api/v3/fengshui/glossary/stars', body: { data: [{ number: 1, name: 'White' }] })
      result = client.fengshui.get_stars_glossary
      expect(result).to be_a(Array).or be_a(Hash)
    end
  end
end
