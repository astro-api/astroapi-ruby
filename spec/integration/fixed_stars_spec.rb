# frozen_string_literal: true

RSpec.describe 'Fixed Stars API' do
  include_context 'api client'

  describe '#get_positions' do
    it 'returns star positions' do
      stub_unless_live(:post, '/api/v3/fixed-stars/positions', body: { data: { stars: [] } })
      result = client.fixed_stars.get_positions(valid_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_conjunctions' do
    it 'returns conjunctions' do
      stub_unless_live(:post, '/api/v3/fixed-stars/conjunctions', body: { data: { conjunctions: [] } })
      result = client.fixed_stars.get_conjunctions(valid_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#generate_report' do
    it 'returns report' do
      stub_unless_live(:post, '/api/v3/fixed-stars/report', body: { data: { report: 'text' } })
      result = client.fixed_stars.generate_report(valid_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_presets' do
    it 'returns presets' do
      stub_unless_live(:get, '/api/v3/fixed-stars/presets', body: { data: [{ name: 'Royal Stars' }] })
      result = client.fixed_stars.get_presets
      expect(result).to be_a(Array).or be_a(Hash)
    end
  end
end
