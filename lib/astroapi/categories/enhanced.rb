# frozen_string_literal: true

require_relative 'base_category'
require_relative '../validators/subject_validator'

module Astroapi
  module Categories
    # Enhanced category client for enhanced analysis with chart data
    class Enhanced < BaseCategory
      # Get global analysis
      # @param request [Hash] Date, time, location
      # @return [Hash] Analysis without birth chart
      def get_global_analysis(request)
        http.post(build_url('global-analysis'), body: request)
      end

      # Get personal analysis
      # @param request [Hash] Subject birth data
      # @return [Hash] Birth chart analysis
      def get_personal_analysis(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('personal-analysis'), body: request)
      end

      # Get global analysis with chart
      # @param request [Hash] Date, time, location
      # @return [Hash] Analysis with chart rendering data
      def get_global_analysis_chart(request)
        http.post(build_custom_url('/api/v3/enhanced_charts', 'global-analysis'), body: request)
      end

      # Get personal analysis with chart
      # @param request [Hash] Subject birth data
      # @return [Hash] Analysis with chart rendering data
      def get_personal_analysis_chart(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_custom_url('/api/v3/enhanced_charts', 'personal-analysis'), body: request)
      end

      protected

      def api_prefix
        '/api/v3/enhanced'
      end

      # Build URL with custom prefix (for enhanced_charts endpoints)
      def build_custom_url(prefix, *segments)
        path_segments = [prefix, *segments.compact].map { |s| s.to_s.gsub(%r{^/+|/+$}, '') }
        "/#{path_segments.join('/')}"
      end
    end
  end
end
