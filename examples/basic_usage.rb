#!/usr/bin/env ruby
# frozen_string_literal: true

require 'bundler/setup'
require 'astroapi'

# Initialize client with API key
client = Astroapi::Client.new(api_key: ENV.fetch('ASTROLOGY_API_KEY', 'your-api-key-here'))

# Example birth data
birth_data = {
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

begin
  # Get planetary positions
  puts "Fetching planetary positions..."
  positions = client.data.get_positions(birth_data)

  puts "\nPlanetary Positions:"
  puts "===================="
  positions.each do |planet, data|
    next unless data.is_a?(Hash)

    puts "\n#{data['name']}:"
    puts "  Sign: #{data['sign']}"
    puts "  Degrees: #{data['degrees_in_sign']}°"
    puts "  Retrograde: #{data['retrograde'] ? 'Yes' : 'No'}"
  end

  # Get current moment
  puts "\n\nFetching current planetary positions..."
  current = client.data.get_current_moment

  puts "\nCurrent Moment:"
  puts "==============="
  puts "Sun: #{current['sun']['sign']} #{current['sun']['degrees_in_sign']}°"
  puts "Moon: #{current['moon']['sign']} #{current['moon']['degrees_in_sign']}°"

rescue Astroapi::ValidationError => e
  puts "Validation error: #{e.message}"
rescue Astroapi::ClientError => e
  puts "Client error (#{e.status_code}): #{e.message}"
rescue Astroapi::ServerError => e
  puts "Server error (#{e.status_code}): #{e.message}"
rescue Astroapi::Error => e
  puts "API error: #{e.message}"
end
