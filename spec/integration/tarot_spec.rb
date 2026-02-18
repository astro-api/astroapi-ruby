# frozen_string_literal: true

RSpec.describe 'Tarot API' do
  include_context 'api client'

  let(:tarot_request) { { question: 'What does my future hold for me?' } }

  describe '#get_cards_glossary' do
    it 'returns cards glossary' do
      stub_unless_live(:get, '/api/v3/tarot/glossary/cards', body: { data: [{ name: 'The Fool' }] })
      result = client.tarot.get_cards_glossary
      expect(result).to be_a(Array).or be_a(Hash)
    end
  end

  describe '#get_spreads_glossary' do
    it 'returns spreads glossary' do
      stub_unless_live(:get, '/api/v3/tarot/glossary/spreads', body: { data: [{ name: 'Celtic Cross' }] })
      result = client.tarot.get_spreads_glossary
      expect(result).to be_a(Array).or be_a(Hash)
    end
  end

  describe '#get_card_details' do
    it 'returns card details' do
      stub_unless_live(:get, '/api/v3/tarot/glossary/cards/the-fool', body: { data: { name: 'The Fool' } })
      result = client.tarot.get_card_details('the-fool')
      expect(result).to be_a(Hash)
    end
  end

  describe '#draw_cards' do
    it 'returns drawn cards' do
      stub_unless_live(:post, '/api/v3/tarot/cards/draw', body: { data: { cards: [] } })
      result = client.tarot.draw_cards({ spread_type: 'three-card' })
      expect(result).to be_a(Hash)
    end
  end

  describe '#search_cards' do
    it 'returns search results' do
      stub_unless_live(:get, '/api/v3/tarot/cards/search', body: { data: [{ name: 'The Fool' }] })
      result = client.tarot.search_cards
      expect(result).to be_a(Array).or be_a(Hash)
    end
  end

  describe '#get_daily_card' do
    it 'returns daily card' do
      stub_unless_live(:get, '/api/v3/tarot/cards/daily', body: { data: { card: 'The Fool' } })
      params = live_mode? ? { user_id: 'test-user-123' } : {}
      result = client.tarot.get_daily_card(params)
      expect(result).to be_a(Hash)
    end
  end

  describe '#generate_single_report' do
    it 'returns single card report' do
      stub_unless_live(:post, '/api/v3/tarot/reports/single', body: { data: { report: 'text' } })
      result = client.tarot.generate_single_report(tarot_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#generate_three_card_report' do
    it 'returns three card report' do
      stub_unless_live(:post, '/api/v3/tarot/reports/three-card', body: { data: { report: 'text' } })
      result = client.tarot.generate_three_card_report(tarot_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#generate_celtic_cross_report' do
    it 'returns celtic cross report' do
      stub_unless_live(:post, '/api/v3/tarot/reports/celtic-cross', body: { data: { report: 'text' } })
      result = client.tarot.generate_celtic_cross_report(tarot_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#generate_synastry_report' do
    it 'returns synastry report' do
      stub_unless_live(:post, '/api/v3/tarot/reports/synastry', body: { data: { report: 'text' } })
      result = client.tarot.generate_synastry_report(two_subjects_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#generate_houses_report' do
    it 'returns houses report' do
      stub_unless_live(:post, '/api/v3/tarot/reports/houses', body: { data: { report: 'text' } })
      result = client.tarot.generate_houses_report(valid_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#generate_tree_of_life_report' do
    it 'returns tree of life report' do
      stub_unless_live(:post, '/api/v3/tarot/reports/tree-of-life', body: { data: { report: 'text' } })
      result = client.tarot.generate_tree_of_life_report({ spread_type: 'tree_of_life' })
      expect(result).to be_a(Hash)
    end
  end

  describe '#calculate_quintessence' do
    it 'returns quintessence' do
      stub_unless_live(:post, '/api/v3/tarot/analysis/quintessence', body: { data: { card: 'The Magician' } })
      result = client.tarot.calculate_quintessence({ cards: %w[the-fool the-magician the-high-priestess] })
      expect(result).to be_a(Hash)
    end
  end

  describe '#calculate_birth_cards' do
    it 'returns birth cards' do
      stub_unless_live(:post, '/api/v3/tarot/analysis/birth-cards', body: { data: { cards: [] } })
      result = client.tarot.calculate_birth_cards({ birth_date: '1990-05-11' })
      expect(result).to be_a(Hash)
    end
  end

  describe '#calculate_elemental_dignities' do
    it 'returns elemental dignities' do
      stub_unless_live(:post, '/api/v3/tarot/analysis/dignities', body: { data: { dignities: [] } })
      request = { cards: [{ id: 'major_00', position: 0 }, { id: 'major_01', position: 0 }, { id: 'major_02', position: 0 }] }
      result = client.tarot.calculate_elemental_dignities(request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#analyze_timing' do
    it 'returns timing analysis' do
      stub_unless_live(:post, '/api/v3/tarot/analysis/timing', body: { data: { timing: {} } })
      expect_no_api_error do
        result = client.tarot.analyze_timing({ cards: %w[major_00 major_01] })
        expect(result).to be_a(Hash)
      end
    end
  end

  describe '#calculate_optimal_times' do
    it 'returns optimal times' do
      stub_unless_live(:post, '/api/v3/tarot/analysis/optimal-times', body: { data: { times: [] } })
      expect_no_api_error do
        request = {
          birth_data: birth_data,
          question_type: 'career',
          date_range: { start_date: '2024-06-01', end_date: '2024-07-01' }
        }
        result = client.tarot.calculate_optimal_times(request)
        expect(result).to be_a(Hash)
      end
    end
  end

  describe '#generate_transit_report' do
    it 'returns transit report' do
      stub_unless_live(:post, '/api/v3/tarot/analysis/transit-report', body: { data: { report: 'text' } })
      result = client.tarot.generate_transit_report({ birth_data: birth_data })
      expect(result).to be_a(Hash)
    end
  end

  describe '#generate_natal_report' do
    it 'returns natal report' do
      stub_unless_live(:post, '/api/v3/tarot/analysis/natal-report', body: { data: { report: 'text' } })
      result = client.tarot.generate_natal_report({ birth_data: birth_data })
      expect(result).to be_a(Hash)
    end
  end
end
