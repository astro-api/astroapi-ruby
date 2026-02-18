# frozen_string_literal: true

RSpec.describe 'Render API' do
  include_context 'api client'

  describe '#render_natal' do
    it 'returns rendered natal chart' do
      stub_unless_live(:post, '/api/v3/render/natal', body: { data: { image: 'base64data' } })
      result = client.render.render_natal(valid_request)
      expect(result).to be_a(Hash).or be_a(String)
    end
  end

  describe '#render_synastry' do
    it 'returns rendered synastry chart' do
      stub_unless_live(:post, '/api/v3/render/synastry', body: { data: { image: 'base64data' } })
      result = client.render.render_synastry(two_subjects_request)
      expect(result).to be_a(Hash).or be_a(String)
    end
  end

  describe '#render_composite' do
    it 'returns rendered composite chart' do
      stub_unless_live(:post, '/api/v3/render/composite', body: { data: { image: 'base64data' } })
      result = client.render.render_composite(two_subjects_request)
      expect(result).to be_a(Hash).or be_a(String)
    end
  end

  describe '#render_transit' do
    it 'returns rendered transit chart' do
      stub_unless_live(:post, '/api/v3/render/transit', body: { data: { image: 'base64data' } })
      result = client.render.render_transit(transit_request)
      expect(result).to be_a(Hash).or be_a(String)
    end
  end
end
