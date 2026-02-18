# frozen_string_literal: true

RSpec.describe 'Insights API' do
  include_context 'api client'

  describe 'InsightsCategory' do
    describe '#discover' do
      it 'returns available insights' do
        stub_unless_live(:get, '/api/v3/insights', body: { data: { categories: [] } })
        result = client.insights.discover
        expect(result).to be_a(Hash).or be_a(Array).or be_a(String)
      end
    end
  end

  describe 'Relationship' do
    describe '#discover' do
      it 'returns relationship insights' do
        stub_unless_live(:get, '/api/v3/insights/relationship', body: { data: { endpoints: [] } })
        result = client.insights.relationship.discover
        expect(result).to be_a(Hash).or be_a(Array).or be_a(String)
      end
    end

    describe '#get_compatibility' do
      it 'returns compatibility' do
        stub_unless_live(:post, '/api/v3/insights/relationship/compatibility', body: { data: { score: 85 } })
        result = client.insights.relationship.get_compatibility(two_subjects_request)
        expect(result).to be_a(Hash)
      end
    end

    describe '#get_compatibility_score' do
      it 'returns score' do
        stub_unless_live(:post, '/api/v3/insights/relationship/compatibility-score', body: { data: { score: 85 } })
        result = client.insights.relationship.get_compatibility_score(two_subjects_request)
        expect(result).to be_a(Hash)
      end
    end

    describe '#get_love_languages' do
      it 'returns love languages' do
        stub_unless_live(:post, '/api/v3/insights/relationship/love-languages', body: { data: { languages: [] } })
        result = client.insights.relationship.get_love_languages(valid_request)
        expect(result).to be_a(Hash)
      end
    end

    describe '#get_davison_report' do
      it 'returns Davison report' do
        stub_unless_live(:post, '/api/v3/insights/relationship/davison', body: { data: { report: 'text' } })
        result = client.insights.relationship.get_davison_report(two_subjects_request)
        expect(result).to be_a(Hash)
      end
    end

    describe '#get_timing' do
      it 'returns timing analysis' do
        stub_unless_live(:post, '/api/v3/insights/relationship/timing', body: { data: { timing: {} } })
        result = client.insights.relationship.get_timing(two_subjects_request)
        expect(result).to be_a(Hash)
      end
    end

    describe '#get_red_flags' do
      it 'returns red flags' do
        stub_unless_live(:post, '/api/v3/insights/relationship/red-flags', body: { data: { flags: [] } })
        result = client.insights.relationship.get_red_flags(valid_request)
        expect(result).to be_a(Hash)
      end
    end
  end

  describe 'Pet' do
    let(:pet_request) do
      {
        pet: { name: 'Buddy', species: 'dog', birth_data: { year: 2020, month: 3, day: 15 } },
        subject: valid_request[:subject]
      }
    end

    describe '#get_personality' do
      it 'returns pet personality' do
        stub_unless_live(:post, '/api/v3/insights/pet/personality', body: { data: { personality: {} } })
        result = client.insights.pet.get_personality(pet_request)
        expect(result).to be_a(Hash)
      end
    end

    describe '#get_compatibility' do
      it 'returns pet compatibility' do
        stub_unless_live(:post, '/api/v3/insights/pet/compatibility', body: { data: { score: 80 } })
        request = {
          subjects: [
            { birth_data: birth_data },
            { name: 'Buddy', species: 'dog',
              birth_data: { year: 2020, month: 3, day: 15, city: 'London', country_code: 'GB' } }
          ]
        }
        result = client.insights.pet.get_compatibility(request)
        expect(result).to be_a(Hash)
      end
    end

    describe '#get_training_windows' do
      it 'returns training windows' do
        stub_unless_live(:post, '/api/v3/insights/pet/training-windows', body: { data: { windows: [] } })
        result = client.insights.pet.get_training_windows(pet_request)
        expect(result).to be_a(Hash)
      end
    end

    describe '#get_health_sensitivities' do
      it 'returns health sensitivities' do
        stub_unless_live(:post, '/api/v3/insights/pet/health-sensitivities', body: { data: { sensitivities: [] } })
        result = client.insights.pet.get_health_sensitivities(pet_request)
        expect(result).to be_a(Hash)
      end
    end

    describe '#get_multi_pet_dynamics' do
      it 'returns multi-pet dynamics' do
        stub_unless_live(:post, '/api/v3/insights/pet/multi-pet-dynamics', body: { data: { dynamics: {} } })
        pets_request = {
          pets: [
            { name: 'Buddy', species: 'dog', birth_data: { year: 2020, month: 3, day: 15 } },
            { name: 'Whiskers', species: 'cat', birth_data: { year: 2019, month: 7, day: 22 } }
          ]
        }
        result = client.insights.pet.get_multi_pet_dynamics(pets_request)
        expect(result).to be_a(Hash)
      end
    end
  end

  describe 'Wellness' do
    describe '#get_body_mapping' do
      it 'returns body mapping' do
        stub_unless_live(:post, '/api/v3/insights/wellness/body-mapping', body: { data: { mapping: {} } })
        result = client.insights.wellness.get_body_mapping(valid_request)
        expect(result).to be_a(Hash)
      end
    end

    describe '#get_biorhythms' do
      it 'returns biorhythms' do
        stub_unless_live(:post, '/api/v3/insights/wellness/biorhythms', body: { data: { cycles: [] } })
        result = client.insights.wellness.get_biorhythms(valid_request)
        expect(result).to be_a(Hash)
      end
    end

    describe '#get_wellness_timing' do
      it 'returns wellness timing' do
        stub_unless_live(:post, '/api/v3/insights/wellness/wellness-timing', body: { data: { timing: {} } })
        result = client.insights.wellness.get_wellness_timing(valid_request)
        expect(result).to be_a(Hash)
      end
    end

    describe '#get_energy_patterns' do
      it 'returns energy patterns' do
        stub_unless_live(:post, '/api/v3/insights/wellness/energy-patterns', body: { data: { patterns: [] } })
        result = client.insights.wellness.get_energy_patterns(valid_request)
        expect(result).to be_a(Hash)
      end
    end

    describe '#get_wellness_score' do
      it 'returns wellness score' do
        stub_unless_live(:post, '/api/v3/insights/wellness/wellness-score', body: { data: { score: 75 } })
        result = client.insights.wellness.get_wellness_score(valid_request)
        expect(result).to be_a(Hash)
      end
    end

    describe '#get_moon_wellness' do
      it 'returns moon wellness' do
        stub_unless_live(:post, '/api/v3/insights/wellness/moon-wellness', body: { data: { wellness: {} } })
        result = client.insights.wellness.get_moon_wellness(valid_request)
        expect(result).to be_a(Hash)
      end
    end
  end

  describe 'Financial' do
    let(:financial_request) do
      { start_date: '2024-06-01', end_date: '2024-08-01' }
    end

    describe '#get_market_timing' do
      it 'returns market timing' do
        stub_unless_live(:post, '/api/v3/insights/financial/market-timing', body: { data: { timing: {} } })
        expect_no_api_error do
          result = client.insights.financial.get_market_timing(financial_request)
          expect(result).to be_a(Hash)
        end
      end
    end

    describe '#analyze_personal_trading' do
      it 'returns personal trading analysis' do
        stub_unless_live(:post, '/api/v3/insights/financial/personal-trading', body: { data: { style: {} } })
        result = client.insights.financial.analyze_personal_trading(valid_request)
        expect(result).to be_a(Hash)
      end
    end

    describe '#get_gann_analysis' do
      it 'returns Gann analysis' do
        stub_unless_live(:post, '/api/v3/insights/financial/gann-analysis', body: { data: { analysis: {} } })
        result = client.insights.financial.get_gann_analysis(financial_request)
        expect(result).to be_a(Hash)
      end
    end

    describe '#get_bradley_siderograph' do
      it 'returns Bradley siderograph' do
        stub_unless_live(:post, '/api/v3/insights/financial/bradley-siderograph', body: { data: { graph: {} } })
        result = client.insights.financial.get_bradley_siderograph(financial_request)
        expect(result).to be_a(Hash)
      end
    end

    describe '#get_crypto_timing' do
      it 'returns crypto timing' do
        stub_unless_live(:post, '/api/v3/insights/financial/crypto-timing', body: { data: { timing: {} } })
        result = client.insights.financial.get_crypto_timing(financial_request)
        expect(result).to be_a(Hash)
      end
    end

    describe '#get_forex_timing' do
      it 'returns forex timing' do
        stub_unless_live(:post, '/api/v3/insights/financial/forex-timing', body: { data: { timing: {} } })
        result = client.insights.financial.get_forex_timing(financial_request)
        expect(result).to be_a(Hash)
      end
    end
  end

  describe 'Business' do
    let(:subjects_request) do
      {
        subjects: [
          { birth_data: birth_data },
          { birth_data: birth_data2 }
        ]
      }
    end

    describe '#get_team_dynamics' do
      it 'returns team dynamics' do
        stub_unless_live(:post, '/api/v3/insights/business/team-dynamics', body: { data: { dynamics: {} } })
        result = client.insights.business.get_team_dynamics(subjects_request)
        expect(result).to be_a(Hash)
      end
    end

    describe '#get_hiring_compatibility' do
      it 'returns hiring compatibility' do
        stub_unless_live(:post, '/api/v3/insights/business/hiring-compatibility', body: { data: { score: 80 } })
        expect_no_api_error do
          result = client.insights.business.get_hiring_compatibility(two_subjects_request)
          expect(result).to be_a(Hash)
        end
      end
    end

    describe '#get_leadership_style' do
      it 'returns leadership style' do
        stub_unless_live(:post, '/api/v3/insights/business/leadership-style', body: { data: { style: {} } })
        result = client.insights.business.get_leadership_style(valid_request)
        expect(result).to be_a(Hash)
      end
    end

    describe '#get_business_timing' do
      it 'returns business timing' do
        stub_unless_live(:post, '/api/v3/insights/business/business-timing', body: { data: { timing: {} } })
        result = client.insights.business.get_business_timing(valid_request)
        expect(result).to be_a(Hash)
      end
    end

    describe '#get_department_compatibility' do
      it 'returns department compatibility' do
        stub_unless_live(:post, '/api/v3/insights/business/department-compatibility',
                         body: { data: { compatibility: {} } })
        result = client.insights.business.get_department_compatibility(subjects_request)
        expect(result).to be_a(Hash)
      end
    end

    describe '#get_succession_planning' do
      it 'returns succession planning' do
        stub_unless_live(:post, '/api/v3/insights/business/succession-planning', body: { data: { plan: {} } })
        result = client.insights.business.get_succession_planning(two_subjects_request)
        expect(result).to be_a(Hash)
      end
    end
  end
end
