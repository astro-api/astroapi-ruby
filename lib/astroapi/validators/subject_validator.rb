# frozen_string_literal: true

require_relative 'base_validator'

module Astroapi
  module Validators
    # Validator for subject/birth data
    class SubjectValidator < BaseValidator
      protected

      def perform_validation
        return add_error('Subject must be a Hash') unless @value.is_a?(Hash)

        validate_birth_data
        validate_location
      end

      private

      def validate_birth_data
        birth_data = @value[:birth_data] || @value['birth_data']
        return add_error('birth_data is required') if birth_data.nil?
        return add_error('birth_data must be a Hash') unless birth_data.is_a?(Hash)

        # Validate date components
        validate_presence(birth_data, :year, 'year')
        validate_presence(birth_data, :month, 'month')
        validate_presence(birth_data, :day, 'day')

        year = birth_data[:year] || birth_data['year']
        month = birth_data[:month] || birth_data['month']
        day = birth_data[:day] || birth_data['day']

        validate_range(year, 1800..2200, 'year')
        validate_range(month, 1..12, 'month')
        validate_range(day, 1..31, 'day')

        # Validate time components
        validate_presence(birth_data, :hour, 'hour')
        validate_presence(birth_data, :minute, 'minute')

        hour = birth_data[:hour] || birth_data['hour']
        minute = birth_data[:minute] || birth_data['minute']

        validate_range(hour, 0..23, 'hour')
        validate_range(minute, 0..59, 'minute')
      end

      def validate_location
        birth_data = @value[:birth_data] || @value['birth_data']
        return if birth_data.nil?

        city = birth_data[:city] || birth_data['city']
        country_code = birth_data[:country_code] || birth_data['country_code']
        latitude = birth_data[:latitude] || birth_data['latitude']
        longitude = birth_data[:longitude] || birth_data['longitude']

        has_city_location = city && country_code
        has_coordinates = latitude && longitude

        unless has_city_location || has_coordinates
          add_error('Either city/country_code OR latitude/longitude is required')
        end

        # Validate coordinates if provided
        if latitude || longitude
          validate_range(latitude, -90..90, 'latitude') if latitude
          validate_range(longitude, -180..180, 'longitude') if longitude

          if (latitude && !longitude) || (!latitude && longitude)
            add_error('Both latitude and longitude must be provided together')
          end
        end

        # Validate city/country if provided
        return unless city || country_code

        validate_string_non_empty(city, 'city') if city
        validate_string_non_empty(country_code, 'country_code') if country_code

        return unless (city && !country_code) || (!city && country_code)

        add_error('Both city and country_code must be provided together')
      end
    end
  end
end
