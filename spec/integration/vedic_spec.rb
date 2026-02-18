# frozen_string_literal: true

RSpec.describe 'Vedic API' do
  include_context 'api client'

  describe '#get_birth_details' do
    it 'returns birth details' do
      stub_unless_live(:post, '/api/v3/vedic/birth-details', body: { data: { details: {} } })
      result = client.vedic.get_birth_details(valid_request)
      expect(result).to be_a(Hash)
      expect(result).not_to be_empty if live_mode?
    end
  end

  describe '#get_chart' do
    it 'returns chart' do
      stub_unless_live(:post, '/api/v3/vedic/chart', body: { data: { chart: {} } })
      result = client.vedic.get_chart(valid_request)
      expect(result).to be_a(Hash).or be_a(String)
    end
  end

  describe '#render_chart' do
    it 'returns rendered chart' do
      stub_unless_live(:post, '/api/v3/vedic/chart/render/png', body: { data: { image: 'data' } })
      result = client.vedic.render_chart('png', valid_request)
      expect(result).to be_a(Hash).or be_a(String)
    end
  end

  describe '#get_divisional_chart' do
    it 'returns divisional chart' do
      stub_unless_live(:post, '/api/v3/vedic/divisional-chart', body: { data: { chart: {} } })
      result = client.vedic.get_divisional_chart(valid_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_panchang' do
    it 'returns panchang' do
      stub_unless_live(:post, '/api/v3/vedic/panchang', body: { data: { panchang: {} } })
      result = client.vedic.get_panchang({ datetime_location: datetime_location })
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_regional_panchang' do
    it 'returns regional panchang' do
      stub_unless_live(:post, '/api/v3/vedic/regional-panchang', body: { data: { panchang: {} } })
      request = { year: 2024, month: 6, day: 15, latitude: 51.5074, longitude: -0.1278, timezone: 'Europe/London' }
      result = client.vedic.get_regional_panchang(request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#calculate_ashtakvarga' do
    it 'returns ashtakvarga' do
      stub_unless_live(:post, '/api/v3/vedic/ashtakvarga', body: { data: { ashtakvarga: {} } })
      expect_no_api_error do
        result = client.vedic.calculate_ashtakvarga(valid_request)
        expect(result).to be_a(Hash)
      end
    end
  end

  describe '#calculate_shadbala' do
    it 'returns shadbala' do
      stub_unless_live(:post, '/api/v3/vedic/shadbala', body: { data: { shadbala: {} } })
      result = client.vedic.calculate_shadbala(valid_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_vimshottari_dasha' do
    it 'returns dasha periods' do
      stub_unless_live(:post, '/api/v3/vedic/vimshottari-dasha', body: { data: { dasha: [] } })
      result = client.vedic.get_vimshottari_dasha(valid_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_yogini_dasha' do
    it 'returns yogini dasha' do
      stub_unless_live(:post, '/api/v3/vedic/yogini-dasha', body: { data: { dasha: [] } })
      result = client.vedic.get_yogini_dasha(valid_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#calculate_chara_dasha' do
    it 'returns chara dasha' do
      stub_unless_live(:post, '/api/v3/vedic/chara-dasha', body: { data: { dasha: [] } })
      result = client.vedic.calculate_chara_dasha(valid_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#analyze_yogas' do
    it 'returns yoga analysis' do
      stub_unless_live(:post, '/api/v3/vedic/yoga-analysis', body: { data: { yogas: [] } })
      result = client.vedic.analyze_yogas(valid_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_nakshatra_predictions' do
    it 'returns nakshatra predictions' do
      stub_unless_live(:post, '/api/v3/vedic/nakshatra-predictions', body: { data: { predictions: {} } })
      result = client.vedic.get_nakshatra_predictions(valid_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_manglik_dosha' do
    it 'returns manglik dosha' do
      stub_unless_live(:post, '/api/v3/vedic/manglik-dosha', body: { data: { manglik: {} } })
      result = client.vedic.get_manglik_dosha(valid_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_kaal_sarpa_dosha' do
    it 'returns kaal sarpa dosha' do
      stub_unless_live(:post, '/api/v3/vedic/kaal-sarpa-dosha', body: { data: { dosha: {} } })
      result = client.vedic.get_kaal_sarpa_dosha(valid_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_sade_sati' do
    it 'returns sade sati' do
      stub_unless_live(:post, '/api/v3/vedic/sade-sati', body: { data: { sade_sati: {} } })
      result = client.vedic.get_sade_sati(valid_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_kundli_matching' do
    it 'returns kundli matching' do
      stub_unless_live(:post, '/api/v3/vedic/kundli-matching', body: { data: { matching: {} } })
      request = { groom: { birth_data: birth_data }, bride: { birth_data: birth_data2 } }
      result = client.vedic.get_kundli_matching(request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_transit' do
    it 'returns transit data' do
      stub_unless_live(:post, '/api/v3/vedic/transit', body: { data: { transit: {} } })
      result = client.vedic.get_transit(transit_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#calculate_varshaphal' do
    it 'returns varshaphal' do
      stub_unless_live(:post, '/api/v3/vedic/varshaphal', body: { data: { varshaphal: {} } })
      result = client.vedic.calculate_varshaphal(valid_request.merge(target_year: 2024))
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_remedies' do
    it 'returns remedies' do
      stub_unless_live(:post, '/api/v3/vedic/remedies', body: { data: { remedies: [] } })
      result = client.vedic.get_remedies(valid_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_festival_calendar' do
    it 'returns festival calendar' do
      stub_unless_live(:post, '/api/v3/vedic/festival-calendar', body: { data: { festivals: [] } })
      result = client.vedic.get_festival_calendar({ year: 2024 })
      expect(result).to be_a(Hash)
    end
  end

  describe '#calculate_kp_system' do
    it 'returns KP system analysis' do
      stub_unless_live(:post, '/api/v3/vedic/kp-system', body: { data: { kp: {} } })
      result = client.vedic.calculate_kp_system(valid_request)
      expect(result).to be_a(Hash)
    end
  end
end
