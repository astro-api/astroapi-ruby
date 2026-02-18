# frozen_string_literal: true

RSpec.describe 'Human Design API' do
  include_context 'api client'

  describe '#calculate_bodygraph' do
    it 'returns bodygraph' do
      stub_unless_live(:post, '/api/v3/human-design/bodygraph', body: { data: { bodygraph: {} } })
      result = client.human_design.calculate_bodygraph(valid_request)
      expect(result).to be_a(Hash)
      expect(result).not_to be_empty if live_mode?
    end
  end

  describe '#get_type' do
    it 'returns type' do
      stub_unless_live(:post, '/api/v3/human-design/type', body: { data: { type: 'Generator' } })
      result = client.human_design.get_type(valid_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#calculate_design_date' do
    it 'returns design date' do
      stub_unless_live(:post, '/api/v3/human-design/design-date', body: { data: { date: '1990-02-05' } })
      result = client.human_design.calculate_design_date(valid_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#calculate_compatibility' do
    it 'returns compatibility' do
      stub_unless_live(:post, '/api/v3/human-design/compatibility', body: { data: { compatibility: {} } })
      result = client.human_design.calculate_compatibility(two_subjects_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#calculate_transits' do
    it 'returns transits' do
      stub_unless_live(:post, '/api/v3/human-design/transits', body: { data: { transits: {} } })
      result = client.human_design.calculate_transits(valid_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_channels_glossary' do
    it 'returns channels' do
      stub_unless_live(:get, '/api/v3/human-design/glossary/channels', body: { data: [{ name: 'Channel 1-8' }] })
      result = client.human_design.get_channels_glossary
      expect(result).to be_a(Array).or be_a(Hash)
    end
  end

  describe '#get_gates_glossary' do
    it 'returns gates' do
      stub_unless_live(:get, '/api/v3/human-design/glossary/gates', body: { data: [{ number: 1 }] })
      result = client.human_design.get_gates_glossary
      expect(result).to be_a(Array).or be_a(Hash)
    end
  end

  describe '#get_types_glossary' do
    it 'returns types' do
      stub_unless_live(:get, '/api/v3/human-design/glossary/types', body: { data: [{ name: 'Generator' }] })
      result = client.human_design.get_types_glossary
      expect(result).to be_a(Array).or be_a(Hash)
    end
  end
end
