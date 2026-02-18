# frozen_string_literal: true

module WebmockHelpers
  def stub_api_request(method, path, status: 200, body: {}, headers: {})
    default_headers = { 'Content-Type' => 'application/json' }
    stub_request(method, "#{Astroapi::Configuration::DEFAULT_BASE_URL}#{path}")
      .to_return(
        status: status,
        body: body.is_a?(String) ? body : body.to_json,
        headers: default_headers.merge(headers)
      )
  end

  def stub_positions_request(status: 200, body: nil)
    body ||= { data: fixture('responses/planetary_positions') }
    stub_api_request(:post, '/api/v3/data/positions', status: status, body: body)
  end

  def fixture(path)
    file_path = File.join(__dir__, '..', 'fixtures', "#{path}.json")
    JSON.parse(File.read(file_path))
  end
end

RSpec.configure do |config|
  config.include WebmockHelpers
end
