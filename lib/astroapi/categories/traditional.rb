# frozen_string_literal: true

require_relative 'base_category'
require_relative '../validators/subject_validator'

module Astroapi
  module Categories
    # Traditional astrology category client
    class Traditional < BaseCategory
      # Get traditional analysis
      # @param request [Hash] Subject birth data
      # @return [Hash] Comprehensive traditional analysis
      def get_analysis(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('analysis'), body: request)
      end

      # Get dignities analysis
      # @param request [Hash] Subject birth data
      # @return [Hash] Essential dignities
      def get_dignities_analysis(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('dignities'), body: request)
      end

      # Get lots analysis
      # @param request [Hash] Subject birth data
      # @return [Hash] Arabic/Hellenistic lots
      def get_lots_analysis(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('lots'), body: request)
      end

      # Get profections analysis
      # @param request [Hash] Subject birth data
      # @return [Hash] Profections analysis
      def get_profections_analysis(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('profections'), body: request)
      end

      # Get annual profection
      # @param request [Hash] Subject and specific year
      # @return [Hash] Profection for year
      def get_annual_profection(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('analysis', 'annual-profection'), body: request)
      end

      # Get profection timeline
      # @param request [Hash] Subject and year range
      # @return [Hash] Multi-year timeline
      def get_profection_timeline(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('analysis', 'profection-timeline'), body: request)
      end

      # Get traditional points glossary
      # @param params [Hash] Query parameters
      # @return [Hash] Traditional points reference
      def get_traditional_points_glossary(params = {})
        http.get(build_url('glossary', 'traditional-points'), params: params)
      end

      # Get dignities glossary
      # @param params [Hash] Query parameters
      # @return [Hash] Dignities reference
      def get_dignities_glossary(params = {})
        http.get(build_url('glossary', 'dignities'), params: params)
      end

      # Get profection houses glossary
      # @param params [Hash] Query parameters
      # @return [Hash] Profection houses reference
      def get_profection_houses_glossary(params = {})
        http.get(build_url('glossary', 'profection-houses'), params: params)
      end

      # Get capabilities
      # @param params [Hash] Query parameters
      # @return [Hash] Available features
      def get_capabilities(params = {})
        http.get(build_url('capabilities'), params: params)
      end

      protected

      def api_prefix
        '/api/v3/traditional'
      end
    end
  end
end
