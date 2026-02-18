# frozen_string_literal: true

RSpec.describe 'Analysis API' do
  include_context 'api client'

  describe '#get_natal_report' do
    it 'returns natal report' do
      stub_unless_live(:post, '/api/v3/analysis/natal-report', body: { data: { report: 'text' } })
      result = client.analysis.get_natal_report(valid_request)
      expect(result).to be_a(Hash)
      expect(result).not_to be_empty if live_mode?
    end
  end

  describe '#get_synastry_report' do
    it 'returns synastry report' do
      stub_unless_live(:post, '/api/v3/analysis/synastry-report', body: { data: { report: 'text' } })
      result = client.analysis.get_synastry_report(two_subjects_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_composite_report' do
    it 'returns composite report' do
      stub_unless_live(:post, '/api/v3/analysis/composite-report', body: { data: { report: 'text' } })
      result = client.analysis.get_composite_report(two_subjects_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_compatibility_analysis' do
    it 'returns compatibility analysis' do
      stub_unless_live(:post, '/api/v3/analysis/compatibility', body: { data: { score: 85 } })
      request = { subjects: [{ birth_data: birth_data }, { birth_data: birth_data2 }] }
      result = client.analysis.get_compatibility_analysis(request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_compatibility_score' do
    it 'returns compatibility score' do
      stub_unless_live(:post, '/api/v3/analysis/compatibility-score', body: { data: { score: 85 } })
      result = client.analysis.get_compatibility_score(two_subjects_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_relationship_analysis' do
    it 'returns relationship analysis' do
      stub_unless_live(:post, '/api/v3/analysis/relationship', body: { data: { report: 'text' } })
      result = client.analysis.get_relationship_analysis(two_subjects_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_relationship_score' do
    it 'returns relationship score' do
      stub_unless_live(:post, '/api/v3/analysis/relationship-score', body: { data: { score: 80 } })
      result = client.analysis.get_relationship_score(two_subjects_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_transit_report' do
    it 'returns transit report' do
      stub_unless_live(:post, '/api/v3/analysis/transit-report', body: { data: { report: 'text' } })
      result = client.analysis.get_transit_report(transit_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_natal_transit_report' do
    it 'returns natal transit report' do
      stub_unless_live(:post, '/api/v3/analysis/natal-transit-report', body: { data: { report: 'text' } })
      result = client.analysis.get_natal_transit_report(transit_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_progression_report' do
    it 'returns progression report' do
      stub_unless_live(:post, '/api/v3/analysis/progression-report', body: { data: { report: 'text' } })
      result = client.analysis.get_progression_report(target_date_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_direction_report' do
    it 'returns direction report' do
      stub_unless_live(:post, '/api/v3/analysis/direction-report', body: { data: { report: 'text' } })
      result = client.analysis.get_direction_report(target_date_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_lunar_return_report' do
    it 'returns lunar return report' do
      stub_unless_live(:post, '/api/v3/analysis/lunar-return-report', body: { data: { report: 'text' } })
      result = client.analysis.get_lunar_return_report(return_date_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_solar_return_report' do
    it 'returns solar return report' do
      stub_unless_live(:post, '/api/v3/analysis/solar-return-report', body: { data: { report: 'text' } })
      result = client.analysis.get_solar_return_report(return_year_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_lunar_return_transit_report' do
    it 'returns lunar return transit report' do
      stub_unless_live(:post, '/api/v3/analysis/lunar-return-transit-report', body: { data: { report: 'text' } })
      expect_no_api_error do
        result = client.analysis.get_lunar_return_transit_report(return_date_range_request)
        expect(result).to be_a(Hash)
      end
    end
  end

  describe '#get_solar_return_transit_report' do
    it 'returns solar return transit report' do
      stub_unless_live(:post, '/api/v3/analysis/solar-return-transit-report', body: { data: { report: 'text' } })
      expect_no_api_error do
        result = client.analysis.get_solar_return_transit_report(return_year_range_request)
        expect(result).to be_a(Hash)
      end
    end
  end

  describe '#get_career_analysis' do
    it 'returns career analysis' do
      stub_unless_live(:post, '/api/v3/analysis/career', body: { data: { report: 'text' } })
      result = client.analysis.get_career_analysis(valid_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_health_analysis' do
    it 'returns health analysis' do
      stub_unless_live(:post, '/api/v3/analysis/health', body: { data: { report: 'text' } })
      result = client.analysis.get_health_analysis(valid_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_karmic_analysis' do
    it 'returns karmic analysis' do
      stub_unless_live(:post, '/api/v3/analysis/karmic', body: { data: { report: 'text' } })
      result = client.analysis.get_karmic_analysis(valid_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_psychological_analysis' do
    it 'returns psychological analysis' do
      stub_unless_live(:post, '/api/v3/analysis/psychological', body: { data: { report: 'text' } })
      result = client.analysis.get_psychological_analysis(valid_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_spiritual_analysis' do
    it 'returns spiritual analysis' do
      stub_unless_live(:post, '/api/v3/analysis/spiritual', body: { data: { report: 'text' } })
      result = client.analysis.get_spiritual_analysis(valid_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_predictive_analysis' do
    it 'returns predictive analysis' do
      stub_unless_live(:post, '/api/v3/analysis/predictive', body: { data: { report: 'text' } })
      expect_no_api_error do
        result = client.analysis.get_predictive_analysis(transit_request)
        expect(result).to be_a(Hash)
      end
    end
  end

  describe '#get_vocational_analysis' do
    it 'returns vocational analysis' do
      stub_unless_live(:post, '/api/v3/analysis/vocational', body: { data: { report: 'text' } })
      result = client.analysis.get_vocational_analysis(valid_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_lunar_analysis' do
    it 'returns lunar analysis' do
      stub_unless_live(:post, '/api/v3/analysis/lunar-analysis', body: { data: { report: 'text' } })
      result = client.analysis.get_lunar_analysis(valid_request.merge(datetime_location: datetime_location))
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_relocation_analysis' do
    it 'returns relocation analysis' do
      stub_unless_live(:post, '/api/v3/analysis/relocation', body: { data: { report: 'text' } })
      result = client.analysis.get_relocation_analysis(valid_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_venus_return_report' do
    it 'returns venus return report' do
      stub_unless_live(:post, '/api/v3/analysis/venus-return-report', body: { data: { report: 'text' } })
      result = client.analysis.get_venus_return_report(return_date_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_venus_return_transit_report' do
    it 'returns venus return transit report' do
      stub_unless_live(:post, '/api/v3/analysis/venus-return-transit-report', body: { data: { report: 'text' } })
      expect_no_api_error do
        result = client.analysis.get_venus_return_transit_report(return_date_range_request)
        expect(result).to be_a(Hash)
      end
    end
  end
end
