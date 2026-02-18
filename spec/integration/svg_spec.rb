# frozen_string_literal: true

RSpec.describe 'SVG API' do
  include_context 'api client'

  describe '#get_natal_chart_svg' do
    it 'returns natal SVG' do
      stub_unless_live(:post, '/api/v3/svg/natal', body: { data: { svg: '<svg></svg>' } })
      result = client.svg.get_natal_chart_svg(valid_request)
      expect(result).to be_a(Hash).or be_a(String)
    end
  end

  describe '#get_synastry_chart_svg' do
    it 'returns synastry SVG' do
      stub_unless_live(:post, '/api/v3/svg/synastry', body: { data: { svg: '<svg></svg>' } })
      result = client.svg.get_synastry_chart_svg(two_subjects_request)
      expect(result).to be_a(Hash).or be_a(String)
    end
  end

  describe '#get_composite_chart_svg' do
    it 'returns composite SVG' do
      stub_unless_live(:post, '/api/v3/svg/composite', body: { data: { svg: '<svg></svg>' } })
      result = client.svg.get_composite_chart_svg(two_subjects_request)
      expect(result).to be_a(Hash).or be_a(String)
    end
  end

  describe '#get_transit_chart_svg' do
    it 'returns transit SVG' do
      stub_unless_live(:post, '/api/v3/svg/transit', body: { data: { svg: '<svg></svg>' } })
      result = client.svg.get_transit_chart_svg(transit_request)
      expect(result).to be_a(Hash).or be_a(String)
    end
  end
end
