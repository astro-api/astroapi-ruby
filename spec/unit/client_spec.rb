# frozen_string_literal: true

RSpec.describe Astroapi::Client do
  describe '#initialize' do
    it 'accepts configuration via hash' do
      client = described_class.new(api_key: 'test-key', timeout: 15)

      expect(client.config.api_key).to eq('test-key')
      expect(client.config.timeout).to eq(15)
    end

    it 'accepts configuration via block' do
      client = described_class.new do |config|
        config.api_key = 'test-key'
        config.timeout = 20
        config.debug = true
      end

      expect(client.config.api_key).to eq('test-key')
      expect(client.config.timeout).to eq(20)
      expect(client.config.debug).to be true
    end

    it 'initializes category clients' do
      client = described_class.new(api_key: 'test-key')

      expect(client.data).to be_a(Astroapi::Categories::Data)
    end
  end

  describe 'category clients' do
    let(:client) { described_class.new(api_key: 'test-key') }

    it 'provides access to data client' do
      expect(client.data).to be_a(Astroapi::Categories::Data)
    end
  end
end
