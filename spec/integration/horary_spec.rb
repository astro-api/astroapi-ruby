# frozen_string_literal: true

RSpec.describe 'Horary API' do
  include_context 'api client'

  let(:horary_request) do
    {
      question: 'Will I get the job I applied for recently?',
      question_time: { year: 2024, month: 6, day: 15, hour: 14, minute: 30, city: 'London', country_code: 'GB' }
    }
  end

  describe '#generate_chart' do
    it 'returns horary chart' do
      stub_unless_live(:post, '/api/v3/horary/chart', body: { data: { chart: {} } })
      expect_no_api_error do
        result = client.horary.generate_chart(horary_request)
        expect(result).to be_a(Hash)
      end
    end
  end

  describe '#analyze' do
    it 'returns horary analysis' do
      stub_unless_live(:post, '/api/v3/horary/analyze', body: { data: { analysis: {} } })
      expect_no_api_error do
        result = client.horary.analyze(horary_request)
        expect(result).to be_a(Hash)
      end
    end
  end

  describe '#get_aspects' do
    it 'returns horary aspects' do
      stub_unless_live(:post, '/api/v3/horary/aspects', body: { data: { aspects: [] } })
      request = {
        question_time: { year: 2024, month: 6, day: 15, hour: 14, minute: 30, city: 'London', country_code: 'GB' }
      }
      result = client.horary.get_aspects(request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#analyze_fertility' do
    it 'returns fertility analysis' do
      stub_unless_live(:post, '/api/v3/horary/fertility-analysis', body: { data: { analysis: {} } })
      expect_no_api_error do
        result = client.horary.analyze_fertility(horary_request)
        expect(result).to be_a(Hash)
      end
    end
  end

  describe '#get_categories_glossary' do
    it 'returns categories' do
      stub_unless_live(:get, '/api/v3/horary/glossary/categories', body: { data: [{ name: 'Love' }] })
      result = client.horary.get_categories_glossary
      expect(result).to be_a(Array).or be_a(Hash)
    end
  end

  describe '#get_considerations_glossary' do
    it 'returns considerations' do
      stub_unless_live(:get, '/api/v3/horary/glossary/considerations', body: { data: [{ name: 'Void of Course' }] })
      result = client.horary.get_considerations_glossary
      expect(result).to be_a(Array).or be_a(Hash)
    end
  end
end
