# frozen_string_literal: true

RSpec.describe 'Glossary API' do
  include_context 'api client'

  describe '#get_active_points' do
    it 'returns active points' do
      stub_unless_live(:get, '/api/v3/glossary/active-points', body: { data: [{ name: 'Sun' }] })
      result = client.glossary.get_active_points
      expect(result).to be_a(Array).or be_a(Hash)
    end
  end

  describe '#get_primary_active_points' do
    it 'returns primary active points' do
      stub_unless_live(:get, '/api/v3/glossary/active-points/primary', body: { data: [{ name: 'Sun' }] })
      result = client.glossary.get_primary_active_points
      expect(result).to be_a(Array).or be_a(Hash)
    end
  end

  describe '#get_cities' do
    it 'returns cities' do
      stub_unless_live(:get, '/api/v3/glossary/cities', body: { data: [{ name: 'London' }] })
      result = client.glossary.get_cities
      expect(result).to be_a(Array).or be_a(Hash)
    end
  end

  describe '#get_countries' do
    it 'returns countries' do
      stub_unless_live(:get, '/api/v3/glossary/countries', body: { data: [{ code: 'GB' }] })
      result = client.glossary.get_countries
      expect(result).to be_a(Array).or be_a(Hash)
    end
  end

  describe '#get_elements' do
    it 'returns elements' do
      stub_unless_live(:get, '/api/v3/glossary/elements', body: { data: [{ name: 'Fire' }] })
      result = client.glossary.get_elements
      expect(result).to be_a(Array).or be_a(Hash)
    end
  end

  describe '#get_fixed_stars' do
    it 'returns fixed stars' do
      stub_unless_live(:get, '/api/v3/glossary/fixed-stars', body: { data: [{ name: 'Regulus' }] })
      result = client.glossary.get_fixed_stars
      expect(result).to be_a(Array).or be_a(Hash)
    end
  end

  describe '#get_house_systems' do
    it 'returns house systems' do
      stub_unless_live(:get, '/api/v3/glossary/house-systems', body: { data: [{ name: 'Placidus' }] })
      result = client.glossary.get_house_systems
      expect(result).to be_a(Array).or be_a(Hash)
    end
  end

  describe '#get_houses' do
    it 'returns houses' do
      stub_unless_live(:get, '/api/v3/glossary/houses', body: { data: [{ number: 1 }] })
      result = client.glossary.get_houses
      expect(result).to be_a(Array).or be_a(Hash)
    end
  end

  describe '#get_keywords' do
    it 'returns keywords' do
      stub_unless_live(:get, '/api/v3/glossary/keywords', body: { data: [{ keyword: 'growth' }] })
      result = client.glossary.get_keywords
      expect(result).to be_a(Array).or be_a(Hash)
    end
  end

  describe '#get_languages' do
    it 'returns languages' do
      stub_unless_live(:get, '/api/v3/glossary/languages', body: { data: [{ code: 'en' }] })
      result = client.glossary.get_languages
      expect(result).to be_a(Array).or be_a(Hash)
    end
  end

  describe '#get_life_areas' do
    it 'returns life areas' do
      stub_unless_live(:get, '/api/v3/glossary/life-areas', body: { data: [{ name: 'Career' }] })
      result = client.glossary.get_life_areas
      expect(result).to be_a(Array).or be_a(Hash)
    end
  end

  describe '#get_themes' do
    it 'returns themes' do
      stub_unless_live(:get, '/api/v3/glossary/themes', body: { data: [{ name: 'Modern' }] })
      result = client.glossary.get_themes
      expect(result).to be_a(Array).or be_a(Hash)
    end
  end

  describe '#get_zodiac_types' do
    it 'returns zodiac types' do
      stub_unless_live(:get, '/api/v3/glossary/zodiac-types', body: { data: [{ name: 'Tropical' }] })
      result = client.glossary.get_zodiac_types
      expect(result).to be_a(Array).or be_a(Hash)
    end
  end

  describe '#get_horary_categories' do
    it 'returns horary categories' do
      stub_unless_live(:get, '/api/v3/glossary/horary-categories', body: { data: [{ name: 'Love' }] })
      result = client.glossary.get_horary_categories
      expect(result).to be_a(Array).or be_a(Hash)
    end
  end
end
