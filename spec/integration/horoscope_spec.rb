# frozen_string_literal: true

RSpec.describe 'Horoscope API' do
  include_context 'api client'

  describe '#get_personal_daily_horoscope' do
    it 'returns personal daily horoscope' do
      stub_unless_live(:post, '/api/v3/horoscope/personal/daily', body: { data: { horoscope: 'text' } })
      result = client.horoscope.get_personal_daily_horoscope(valid_request)
      expect(result).to be_a(Hash)
      expect(result).not_to be_empty if live_mode?
    end
  end

  describe '#get_personal_daily_horoscope_text' do
    it 'returns personal daily horoscope text' do
      stub_unless_live(:post, '/api/v3/horoscope/personal/daily/text', body: { data: { text: 'horoscope' } })
      result = client.horoscope.get_personal_daily_horoscope_text(valid_request)
      expect(result).to be_a(Hash).or be_a(String)
    end
  end

  describe '#get_sign_daily_horoscope' do
    it 'returns sign daily horoscope' do
      stub_unless_live(:post, '/api/v3/horoscope/sign/daily', body: { data: { horoscope: 'text' } })
      result = client.horoscope.get_sign_daily_horoscope(sign_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_sign_daily_horoscope_text' do
    it 'returns sign daily horoscope text' do
      stub_unless_live(:post, '/api/v3/horoscope/sign/daily/text', body: { data: { text: 'horoscope' } })
      result = client.horoscope.get_sign_daily_horoscope_text(sign_request)
      expect(result).to be_a(Hash).or be_a(String)
    end
  end

  describe '#get_sign_weekly_horoscope' do
    it 'returns sign weekly horoscope' do
      stub_unless_live(:post, '/api/v3/horoscope/sign/weekly', body: { data: { horoscope: 'text' } })
      result = client.horoscope.get_sign_weekly_horoscope(sign_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_sign_weekly_horoscope_text' do
    it 'returns sign weekly text' do
      stub_unless_live(:post, '/api/v3/horoscope/sign/weekly/text', body: { data: { text: 'horoscope' } })
      result = client.horoscope.get_sign_weekly_horoscope_text(sign_request)
      expect(result).to be_a(Hash).or be_a(String)
    end
  end

  describe '#get_sign_monthly_horoscope' do
    it 'returns sign monthly horoscope' do
      stub_unless_live(:post, '/api/v3/horoscope/sign/monthly', body: { data: { horoscope: 'text' } })
      result = client.horoscope.get_sign_monthly_horoscope(sign_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_sign_monthly_horoscope_text' do
    it 'returns sign monthly text' do
      stub_unless_live(:post, '/api/v3/horoscope/sign/monthly/text', body: { data: { text: 'horoscope' } })
      result = client.horoscope.get_sign_monthly_horoscope_text(sign_request)
      expect(result).to be_a(Hash).or be_a(String)
    end
  end

  describe '#get_sign_yearly_horoscope' do
    it 'returns sign yearly horoscope' do
      stub_unless_live(:post, '/api/v3/horoscope/sign/yearly', body: { data: { horoscope: 'text' } })
      result = client.horoscope.get_sign_yearly_horoscope(sign_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_sign_yearly_horoscope_text' do
    it 'returns sign yearly text' do
      stub_unless_live(:post, '/api/v3/horoscope/sign/yearly/text', body: { data: { text: 'horoscope' } })
      result = client.horoscope.get_sign_yearly_horoscope_text(sign_request)
      expect(result).to be_a(Hash).or be_a(String)
    end
  end

  describe '#get_personal_weekly_horoscope' do
    it 'returns personal weekly horoscope' do
      stub_unless_live(:post, '/api/v3/horoscope/personal/weekly', body: { data: { horoscope: 'text' } })
      result = client.horoscope.get_personal_weekly_horoscope(valid_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_personal_weekly_horoscope_text' do
    it 'returns personal weekly text' do
      stub_unless_live(:post, '/api/v3/horoscope/personal/weekly/text', body: { data: { text: 'horoscope' } })
      result = client.horoscope.get_personal_weekly_horoscope_text(valid_request)
      expect(result).to be_a(Hash).or be_a(String)
    end
  end

  describe '#get_personal_monthly_horoscope' do
    it 'returns personal monthly horoscope' do
      stub_unless_live(:post, '/api/v3/horoscope/personal/monthly', body: { data: { horoscope: 'text' } })
      result = client.horoscope.get_personal_monthly_horoscope(valid_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_personal_monthly_horoscope_text' do
    it 'returns personal monthly text' do
      stub_unless_live(:post, '/api/v3/horoscope/personal/monthly/text', body: { data: { text: 'horoscope' } })
      result = client.horoscope.get_personal_monthly_horoscope_text(valid_request)
      expect(result).to be_a(Hash).or be_a(String)
    end
  end

  describe '#get_personal_yearly_horoscope' do
    it 'returns personal yearly horoscope' do
      stub_unless_live(:post, '/api/v3/horoscope/personal/yearly', body: { data: { horoscope: 'text' } })
      result = client.horoscope.get_personal_yearly_horoscope(valid_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_personal_yearly_horoscope_text' do
    it 'returns personal yearly text' do
      stub_unless_live(:post, '/api/v3/horoscope/personal/yearly/text', body: { data: { text: 'horoscope' } })
      result = client.horoscope.get_personal_yearly_horoscope_text(valid_request)
      expect(result).to be_a(Hash).or be_a(String)
    end
  end

  describe '#get_chinese_horoscope' do
    it 'returns chinese horoscope' do
      stub_unless_live(:post, '/api/v3/horoscope/chinese/bazi', body: { data: { bazi: {} } })
      expect_no_api_error do
        result = client.horoscope.get_chinese_horoscope(valid_request)
        expect(result).to be_a(Hash).or be_a(NilClass)
      end
    end
  end
end
