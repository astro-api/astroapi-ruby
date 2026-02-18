# frozen_string_literal: true

RSpec.describe Astroapi::Categories::Data do
  let(:http_client) { instance_double(Astroapi::HTTP::Client) }
  let(:data_client) { described_class.new(http_client) }

  let(:valid_request) do
    {
      subject: {
        birth_data: {
          year: 1990,
          month: 5,
          day: 11,
          hour: 14,
          minute: 30,
          city: 'London',
          country_code: 'GB'
        }
      }
    }
  end

  describe '#get_positions' do
    it 'validates subject before making request' do
      allow(http_client).to receive(:post).and_return({})
      expect(Astroapi::Validators::SubjectValidator).to receive(:validate!)
      data_client.get_positions(valid_request)
    end

    it 'sends POST request to correct endpoint' do
      allow(Astroapi::Validators::SubjectValidator).to receive(:validate!)
      expect(http_client).to receive(:post)
        .with('/api/v3/data/positions', body: valid_request)
        .and_return({})

      data_client.get_positions(valid_request)
    end

    it 'raises ValidationError for invalid subject' do
      invalid_request = { subject: { birth_data: {} } }

      expect { data_client.get_positions(invalid_request) }
        .to raise_error(Astroapi::ValidationError)
    end
  end

  describe '#get_enhanced_positions' do
    it 'validates subject and sends POST request' do
      allow(Astroapi::Validators::SubjectValidator).to receive(:validate!)
      expect(http_client).to receive(:post)
        .with('/api/v3/data/positions/enhanced', body: valid_request)
        .and_return({})

      data_client.get_enhanced_positions(valid_request)
    end
  end

  describe '#get_global_positions' do
    it 'sends POST request without subject validation' do
      expect(http_client).to receive(:post)
        .with('/api/v3/data/global-positions', body: {})
        .and_return({})

      data_client.get_global_positions
    end

    it 'accepts request options' do
      request = { date: '2024-01-01' }
      expect(http_client).to receive(:post)
        .with('/api/v3/data/global-positions', body: request)
        .and_return({})

      data_client.get_global_positions(request)
    end
  end

  describe '#get_aspects' do
    it 'validates subject and sends POST request' do
      allow(Astroapi::Validators::SubjectValidator).to receive(:validate!)
      expect(http_client).to receive(:post)
        .with('/api/v3/data/aspects', body: valid_request)
        .and_return({})

      data_client.get_aspects(valid_request)
    end
  end

  describe '#get_enhanced_aspects' do
    it 'validates subject and sends POST request' do
      allow(Astroapi::Validators::SubjectValidator).to receive(:validate!)
      expect(http_client).to receive(:post)
        .with('/api/v3/data/aspects/enhanced', body: valid_request)
        .and_return({})

      data_client.get_enhanced_aspects(valid_request)
    end
  end

  describe '#get_house_cusps' do
    it 'validates subject and sends POST request' do
      allow(Astroapi::Validators::SubjectValidator).to receive(:validate!)
      expect(http_client).to receive(:post)
        .with('/api/v3/data/house-cusps', body: valid_request)
        .and_return({})

      data_client.get_house_cusps(valid_request)
    end
  end

  describe '#get_lunar_metrics' do
    it 'validates subject and sends POST request' do
      allow(Astroapi::Validators::SubjectValidator).to receive(:validate!)
      expect(http_client).to receive(:post)
        .with('/api/v3/data/lunar-metrics', body: valid_request)
        .and_return({})

      data_client.get_lunar_metrics(valid_request)
    end
  end

  describe '#get_enhanced_lunar_metrics' do
    it 'validates subject and sends POST request' do
      allow(Astroapi::Validators::SubjectValidator).to receive(:validate!)
      expect(http_client).to receive(:post)
        .with('/api/v3/data/lunar-metrics/enhanced', body: valid_request)
        .and_return({})

      data_client.get_enhanced_lunar_metrics(valid_request)
    end
  end

  describe '#get_current_moment' do
    it 'sends GET request without validation' do
      expect(http_client).to receive(:get)
        .with('/api/v3/data/now')
        .and_return({})

      data_client.get_current_moment
    end
  end
end
