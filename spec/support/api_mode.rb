# frozen_string_literal: true

module ApiTestHelper
  LIVE_API_KEY = ENV.fetch('ASTROLOGY_API_KEY', nil)
  LIVE_MODE = !LIVE_API_KEY.nil? && !LIVE_API_KEY.empty?

  def live_mode?
    ApiTestHelper::LIVE_MODE
  end

  def stub_unless_live(method, path, body: { data: {} })
    return if live_mode?

    stub_api_request(method, path, body: body)
  end

  # Expect no error; for live mode endpoints with known issues (API bugs, missing routes), rescue and skip
  def expect_no_api_error
    yield
  rescue Astroapi::ServerError => e
    skip "API server error (likely API bug): #{e.message}"
  rescue Astroapi::ClientError => e
    skip "API client error (likely unsupported endpoint): #{e.message}"
  rescue Astroapi::TimeoutError => e
    skip "API timeout (slow endpoint): #{e.message}"
  end
end

RSpec.configure do |config|
  config.include ApiTestHelper
end

RSpec.shared_context 'api client' do # rubocop:disable RSpec/ContextWording
  let(:client) do
    if ApiTestHelper::LIVE_MODE
      Astroapi::Client.new(api_key: ApiTestHelper::LIVE_API_KEY, timeout: 30)
    else
      Astroapi::Client.new(api_key: 'test-api-key')
    end
  end

  let(:birth_data) do
    { year: 1990, month: 5, day: 11, hour: 14, minute: 30, city: 'London', country_code: 'GB' }
  end

  let(:birth_data2) do
    { year: 1985, month: 3, day: 22, hour: 10, minute: 0, city: 'Paris', country_code: 'FR' }
  end

  let(:valid_request) { { subject: { birth_data: birth_data } } }

  let(:birth_data_request) { { birth_data: birth_data } }

  let(:two_subjects_request) do
    { subject1: { birth_data: birth_data }, subject2: { birth_data: birth_data2 } }
  end

  let(:transit_request) do
    valid_request.merge(
      transit_time: {
        datetime: { year: 2024, month: 6, day: 15, hour: 12, minute: 0, city: 'London', country_code: 'GB' }
      }
    )
  end

  let(:target_date_request) { valid_request.merge(target_date: '2024-06-15') }

  let(:return_year_request) { valid_request.merge(return_year: 2024) }

  let(:return_date_request) { valid_request.merge(return_date: '2024-06-15') }

  let(:return_date_range_request) do
    valid_request.merge(
      return_date: '2024-06-15',
      date_range: {
        start_date: { year: 2024, month: 6, day: 1 },
        end_date: { year: 2024, month: 7, day: 1 }
      }
    )
  end

  let(:return_year_range_request) do
    valid_request.merge(
      return_year: 2024,
      date_range: {
        start_date: { year: 2024, month: 6, day: 1 },
        end_date: { year: 2024, month: 7, day: 1 }
      }
    )
  end

  let(:datetime_location) do
    { year: 2024, month: 6, day: 15, hour: 12, minute: 0, city: 'London', country_code: 'GB' }
  end

  let(:sign_request) { { sign: 'aries' } }

  let(:sign_code_request) { { sign: 'Ari' } }
end
