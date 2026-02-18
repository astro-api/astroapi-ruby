# frozen_string_literal: true

RSpec.describe 'Chinese API' do
  include_context 'api client'

  describe '#calculate_bazi' do
    it 'returns BaZi chart' do
      stub_unless_live(:post, '/api/v3/chinese/bazi', body: { data: { pillars: {} } })
      result = client.chinese.calculate_bazi(valid_request)
      expect(result).to be_a(Hash)
      expect(result).not_to be_empty if live_mode?
    end
  end

  describe '#calculate_compatibility' do
    it 'returns compatibility' do
      stub_unless_live(:post, '/api/v3/chinese/compatibility', body: { data: { score: 80 } })
      result = client.chinese.calculate_compatibility(two_subjects_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#calculate_luck_pillars' do
    it 'returns luck pillars' do
      stub_unless_live(:post, '/api/v3/chinese/luck-pillars', body: { data: { pillars: [] } })
      result = client.chinese.calculate_luck_pillars(valid_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#calculate_ming_gua' do
    it 'returns Ming Gua' do
      stub_unless_live(:post, '/api/v3/chinese/ming-gua', body: { data: { number: 4 } })
      result = client.chinese.calculate_ming_gua(valid_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_yearly_forecast' do
    it 'returns yearly forecast' do
      stub_unless_live(:post, '/api/v3/chinese/yearly-forecast', body: { data: { forecast: 'text' } })
      result = client.chinese.get_yearly_forecast(valid_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#analyze_year_elements' do
    it 'returns year elements' do
      stub_unless_live(:get, '/api/v3/chinese/elements/balance/2024', body: { data: { elements: {} } })
      result = client.chinese.analyze_year_elements(2024)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_solar_terms' do
    it 'returns solar terms' do
      stub_unless_live(:get, '/api/v3/chinese/calendar/solar-terms/2024', body: { data: { terms: [] } })
      result = client.chinese.get_solar_terms(2024)
      expect(result).to be_a(Hash).or be_a(Array)
    end
  end

  describe '#get_zodiac_animal' do
    it 'returns zodiac animal info' do
      stub_unless_live(:get, '/api/v3/chinese/zodiac/rat', body: { data: { animal: 'Rat' } })
      result = client.chinese.get_zodiac_animal('rat')
      expect(result).to be_a(Hash)
    end
  end
end
