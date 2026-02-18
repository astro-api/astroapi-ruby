# frozen_string_literal: true

require_relative 'base_category'

module Astroapi
  module Categories
    # Chinese astrology and BaZi category client
    class Chinese < BaseCategory
      # Calculate BaZi (Four Pillars)
      # @param request [Hash] Birth data
      # @return [Hash] Four Pillars chart
      def calculate_bazi(request)
        http.post(build_url('bazi'), body: request)
      end

      # Calculate compatibility
      # @param request [Hash] Two subjects' birth data
      # @return [Hash] Chinese compatibility analysis
      def calculate_compatibility(request)
        http.post(build_url('compatibility'), body: request)
      end

      # Calculate luck pillars
      # @param request [Hash] Birth data
      # @return [Hash] Da Yun periods
      def calculate_luck_pillars(request)
        http.post(build_url('luck-pillars'), body: request)
      end

      # Calculate Ming Gua
      # @param request [Hash] Birth data
      # @return [Hash] Feng Shui number
      def calculate_ming_gua(request)
        http.post(build_url('ming-gua'), body: request)
      end

      # Get yearly forecast
      # @param request [Hash] Birth data and year
      # @return [Hash] Annual forecast
      def get_yearly_forecast(request)
        http.post(build_url('yearly-forecast'), body: request)
      end

      # Analyze year elements
      # @param year [Integer] Year to analyze
      # @return [Hash] Five elements for year
      def analyze_year_elements(year)
        http.get(build_url('elements', 'balance', year.to_s))
      end

      # Get solar terms
      # @param year [Integer] Year
      # @return [Hash] 24 Solar Terms
      def get_solar_terms(year)
        http.get(build_url('calendar', 'solar-terms', year.to_s))
      end

      # Get zodiac animal info
      # @param animal [String] Animal name
      # @return [Hash] Animal characteristics
      def get_zodiac_animal(animal)
        http.get(build_url('zodiac', animal))
      end

      protected

      def api_prefix
        '/api/v3/chinese'
      end
    end
  end
end
