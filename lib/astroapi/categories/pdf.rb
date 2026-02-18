# frozen_string_literal: true

require_relative 'base_category'
require_relative '../validators/subject_validator'

module Astroapi
  module Categories
    # PDF generation category client
    class Pdf < BaseCategory
      # Generate natal report PDF
      # @param request [Hash] Subject birth data
      # @return [Hash] PDF generation result
      def generate_natal_report(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('natal-report'), body: request)
      end

      # Generate daily horoscope PDF
      # @param request [Hash] Sign and date
      # @return [Hash] PDF generation result
      def generate_daily_horoscope(request)
        http.post(build_url('horoscope', 'daily'), body: request)
      end

      # Generate weekly horoscope PDF
      # @param request [Hash] Sign and date range
      # @return [Hash] PDF generation result
      def generate_weekly_horoscope(request)
        http.post(build_url('horoscope', 'weekly'), body: request)
      end

      # Get daily horoscope data
      # @param sign [String] Zodiac sign
      # @param target_date [String] Target date
      # @return [Hash] Horoscope data for PDF
      def get_horoscope_data(sign, target_date)
        http.get(build_url('horoscope', 'data', sign, target_date))
      end

      protected

      def api_prefix
        '/api/v3/pdf'
      end
    end
  end
end
