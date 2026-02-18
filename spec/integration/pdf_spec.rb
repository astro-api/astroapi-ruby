# frozen_string_literal: true

RSpec.describe 'PDF API' do
  include_context 'api client'

  describe '#generate_natal_report' do
    it 'returns natal report PDF' do
      stub_unless_live(:post, '/api/v3/pdf/natal-report', body: { data: { url: 'https://example.com/report.pdf' } })
      result = client.pdf.generate_natal_report(valid_request)
      expect(result).to be_a(Hash).or be_a(String)
    end
  end

  describe '#generate_daily_horoscope' do
    it 'returns daily horoscope PDF' do
      stub_unless_live(:post, '/api/v3/pdf/horoscope/daily', body: { data: { url: 'https://example.com/daily.pdf' } })
      result = client.pdf.generate_daily_horoscope(sign_code_request)
      expect(result).to be_a(Hash).or be_a(String)
    end
  end

  describe '#generate_weekly_horoscope' do
    it 'returns weekly horoscope PDF' do
      stub_unless_live(:post, '/api/v3/pdf/horoscope/weekly',
                       body: { data: { url: 'https://example.com/weekly.pdf' } })
      expect_no_api_error do
        result = client.pdf.generate_weekly_horoscope(sign_code_request)
        expect(result).to be_a(Hash).or be_a(String)
      end
    end
  end

  describe '#get_horoscope_data' do
    it 'returns horoscope data' do
      stub_unless_live(:get, '/api/v3/pdf/horoscope/data/aries/2024-01-01',
                       body: { data: { horoscope: 'text' } })
      result = client.pdf.get_horoscope_data('aries', '2024-01-01')
      expect(result).to be_a(Hash)
    end
  end
end
