# frozen_string_literal: true

require_relative 'base_category'
require_relative '../validators/subject_validator'

module Astroapi
  module Categories
    # Eclipses category client for eclipse data and analysis
    class Eclipses < BaseCategory
      # Get upcoming eclipses
      # @param params [Hash] Query parameters for filtering
      # @return [Hash] Upcoming eclipses list
      def get_upcoming(params = {})
        http.get(build_url('upcoming'), params: params)
      end

      # Check natal impact
      # @param request [Hash] Subject birth data and eclipse
      # @return [Hash] Eclipse impact on chart
      def check_natal_impact(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('natal-check'), body: request)
      end

      # Get eclipse interpretation
      # @param request [Hash] Subject and eclipse data
      # @return [Hash] Eclipse interpretation
      def get_interpretation(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('interpretation'), body: request)
      end

      protected

      def api_prefix
        '/api/v3/eclipses'
      end
    end
  end
end
