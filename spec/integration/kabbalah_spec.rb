# frozen_string_literal: true

RSpec.describe 'Kabbalah API' do
  include_context 'api client'

  describe '#get_birth_angels' do
    it 'returns birth angels' do
      stub_unless_live(:post, '/api/v3/kabbalah/birth-angels', body: { data: { angels: [] } })
      result = client.kabbalah.get_birth_angels(birth_data_request)
      expect(result).to be_a(Hash)
      expect(result).not_to be_empty if live_mode?
    end
  end

  describe '#calculate_gematria' do
    it 'returns gematria' do
      stub_unless_live(:post, '/api/v3/kabbalah/gematria', body: { data: { value: 42 } })
      result = client.kabbalah.calculate_gematria({ text: 'hello' })
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_tikkun' do
    it 'returns tikkun' do
      stub_unless_live(:post, '/api/v3/kabbalah/tikkun', body: { data: { tikkun: {} } })
      result = client.kabbalah.get_tikkun(birth_data_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_tree_of_life_chart' do
    it 'returns tree of life chart' do
      stub_unless_live(:post, '/api/v3/kabbalah/tree-of-life-chart', body: { data: { chart: {} } })
      result = client.kabbalah.get_tree_of_life_chart(birth_data_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_angels_glossary' do
    it 'returns angels glossary' do
      stub_unless_live(:get, '/api/v3/kabbalah/glossary/angels-72', body: { data: [{ name: 'Vehuiah' }] })
      result = client.kabbalah.get_angels_glossary
      expect(result).to be_a(Array).or be_a(Hash)
    end
  end

  describe '#get_hebrew_letters_glossary' do
    it 'returns hebrew letters' do
      stub_unless_live(:get, '/api/v3/kabbalah/glossary/hebrew-letters', body: { data: [{ letter: 'Aleph' }] })
      result = client.kabbalah.get_hebrew_letters_glossary
      expect(result).to be_a(Array).or be_a(Hash)
    end
  end

  describe '#get_sephiroth_glossary' do
    it 'returns sephiroth' do
      stub_unless_live(:get, '/api/v3/kabbalah/glossary/sephiroth', body: { data: [{ name: 'Keter' }] })
      result = client.kabbalah.get_sephiroth_glossary
      expect(result).to be_a(Array).or be_a(Hash)
    end
  end
end
