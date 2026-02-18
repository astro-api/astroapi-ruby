# frozen_string_literal: true

require_relative 'base_category'

module Astroapi
  module Categories
    # Feng Shui category client
    class Fengshui < BaseCategory
      # Calculate Flying Stars chart
      # @param request [Hash] Building data
      # @return [Hash] Flying Stars chart
      def calculate_flying_stars_chart(request)
        http.post(build_url('flying-stars', 'chart'), body: request)
      end

      # Get annual Flying Stars
      # @param year [Integer] Year
      # @return [Hash] Annual Flying Stars positions
      def get_annual_flying_stars(year)
        http.get(build_url('flying-stars', 'annual', year))
      end

      # Get annual afflictions
      # @param year [Integer] Year
      # @return [Hash] Annual afflictions
      def get_afflictions(year)
        http.get(build_url('afflictions', year))
      end

      # Get Flying Stars glossary
      # @param params [Hash] Query parameters
      # @return [Hash] Stars reference
      def get_stars_glossary(params = {})
        http.get(build_url('glossary', 'stars'), params: params)
      end

      protected

      def api_prefix
        '/api/v3/fengshui'
      end
    end
  end
end
