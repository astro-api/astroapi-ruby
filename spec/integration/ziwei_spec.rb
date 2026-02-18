# frozen_string_literal: true

RSpec.describe 'Ziwei API' do
  include_context 'api client'

  describe '#calculate_chart' do
    it 'returns Zi Wei chart' do
      stub_unless_live(:post, '/api/v3/ziwei/chart', body: { data: { chart: {} } })
      request = { birth_data: birth_data, gender: 'male' }
      result = client.ziwei.calculate_chart(request)
      expect(result).to be_a(Hash)
      expect(result).not_to be_empty if live_mode?
    end
  end
end
