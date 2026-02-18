# frozen_string_literal: true

RSpec.describe 'Traditional API' do
  include_context 'api client'

  describe '#get_analysis' do
    it 'returns traditional analysis' do
      stub_unless_live(:post, '/api/v3/traditional/analysis', body: { data: { analysis: {} } })
      result = client.traditional.get_analysis(valid_request)
      expect(result).to be_a(Hash)
      expect(result).not_to be_empty if live_mode?
    end
  end

  describe '#get_dignities_analysis' do
    it 'returns dignities analysis' do
      stub_unless_live(:post, '/api/v3/traditional/dignities', body: { data: { dignities: {} } })
      result = client.traditional.get_dignities_analysis(valid_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_lots_analysis' do
    it 'returns lots analysis' do
      stub_unless_live(:post, '/api/v3/traditional/lots', body: { data: { lots: [] } })
      result = client.traditional.get_lots_analysis(valid_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_profections_analysis' do
    it 'returns profections analysis' do
      stub_unless_live(:post, '/api/v3/traditional/profections', body: { data: { profections: {} } })
      result = client.traditional.get_profections_analysis(valid_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_annual_profection' do
    it 'returns annual profection' do
      stub_unless_live(:post, '/api/v3/traditional/analysis/annual-profection', body: { data: { profection: {} } })
      result = client.traditional.get_annual_profection(valid_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_profection_timeline' do
    it 'returns profection timeline' do
      stub_unless_live(:post, '/api/v3/traditional/analysis/profection-timeline', body: { data: { timeline: [] } })
      result = client.traditional.get_profection_timeline(valid_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_traditional_points_glossary' do
    it 'returns traditional points' do
      stub_unless_live(:get, '/api/v3/traditional/glossary/traditional-points',
                       body: { data: [{ name: 'Part of Fortune' }] })
      result = client.traditional.get_traditional_points_glossary
      expect(result).to be_a(Array).or be_a(Hash)
    end
  end

  describe '#get_dignities_glossary' do
    it 'returns dignities glossary' do
      stub_unless_live(:get, '/api/v3/traditional/glossary/dignities', body: { data: [{ name: 'Domicile' }] })
      result = client.traditional.get_dignities_glossary
      expect(result).to be_a(Array).or be_a(Hash)
    end
  end

  describe '#get_profection_houses_glossary' do
    it 'returns profection houses' do
      stub_unless_live(:get, '/api/v3/traditional/glossary/profection-houses',
                       body: { data: [{ house: 1 }] })
      result = client.traditional.get_profection_houses_glossary
      expect(result).to be_a(Array).or be_a(Hash)
    end
  end

  describe '#get_capabilities' do
    it 'returns capabilities' do
      stub_unless_live(:get, '/api/v3/traditional/capabilities', body: { data: { features: [] } })
      result = client.traditional.get_capabilities
      expect(result).to be_a(Array).or be_a(Hash)
    end
  end
end
