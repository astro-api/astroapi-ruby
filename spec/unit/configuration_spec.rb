# frozen_string_literal: true

RSpec.describe Astroapi::Configuration do
  describe '#initialize' do
    it 'sets default values' do
      config = described_class.new

      expect(config.base_url).to eq(Astroapi::Configuration::DEFAULT_BASE_URL)
      expect(config.timeout).to eq(Astroapi::Configuration::DEFAULT_TIMEOUT)
      expect(config.debug).to be false
    end

    it 'reads API key from environment' do
      allow(ENV).to receive(:fetch).with('ASTROLOGY_API_KEY', nil).and_return('test-key')
      allow(ENV).to receive(:fetch).with('ASTROLOGY_API_BASE_URL', anything).and_call_original
      allow(ENV).to receive(:fetch).with('ASTROLOGY_DEBUG', nil).and_return(nil)

      config = described_class.new
      expect(config.api_key).to eq('test-key')
    end

    it 'reads base URL from environment' do
      allow(ENV).to receive(:fetch).with('ASTROLOGY_API_KEY', nil).and_return(nil)
      allow(ENV).to receive(:fetch).with('ASTROLOGY_API_BASE_URL', anything)
                                   .and_return('https://custom.api.io')
      allow(ENV).to receive(:fetch).with('ASTROLOGY_DEBUG', nil).and_return(nil)

      config = described_class.new
      expect(config.base_url).to eq('https://custom.api.io')
    end

    it 'reads debug flag from environment' do
      allow(ENV).to receive(:fetch).with('ASTROLOGY_API_KEY', nil).and_return(nil)
      allow(ENV).to receive(:fetch).with('ASTROLOGY_API_BASE_URL', anything).and_call_original
      allow(ENV).to receive(:fetch).with('ASTROLOGY_DEBUG', nil).and_return('true')

      config = described_class.new
      expect(config.debug).to be true
    end
  end

  describe '#retry' do
    it 'returns a RetryConfig instance' do
      config = described_class.new
      expect(config.retry).to be_a(Astroapi::Configuration::RetryConfig)
    end

    it 'has default retry values' do
      config = described_class.new
      expect(config.retry.attempts).to eq(0)
      expect(config.retry.delay_ms).to eq(250)
      expect(config.retry.retry_status_codes).to eq(Astroapi::Configuration::DEFAULT_RETRY_STATUS_CODES)
    end

    it 'allows configuring retry values' do
      config = described_class.new
      config.retry.attempts = 3
      config.retry.delay_ms = 500

      expect(config.retry.attempts).to eq(3)
      expect(config.retry.delay_ms).to eq(500)
    end
  end
end
