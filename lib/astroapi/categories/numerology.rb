# frozen_string_literal: true

require_relative 'base_category'

module Astroapi
  module Categories
    # Numerology category client for numerology calculations
    class Numerology < BaseCategory
      # Get core numbers
      # @param request [Hash] Name and birth data
      # @return [Hash] Life Path, Expression, Soul Urge
      def get_core_numbers(request)
        http.post(build_url('core-numbers'), body: request)
      end

      # Get comprehensive report
      # @param request [Hash] Name and birth data
      # @return [Hash] Full numerology report
      def get_comprehensive_report(request)
        http.post(build_url('comprehensive'), body: request)
      end

      # Analyze compatibility
      # @param request [Hash] Two people's names and birth data
      # @return [Hash] Numerology compatibility
      def analyze_compatibility(request)
        http.post(build_url('compatibility'), body: request)
      end

      protected

      def api_prefix
        '/api/v3/numerology'
      end
    end
  end
end
