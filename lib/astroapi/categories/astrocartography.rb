# frozen_string_literal: true

require_relative 'base_category'
require_relative '../validators/subject_validator'

module Astroapi
  module Categories
    # Astrocartography category client for locational astrology
    class Astrocartography < BaseCategory
      # Get astrocartography lines
      # @param request [Hash] Subject birth data
      # @return [Hash] Planetary AC/DC/MC/IC lines
      def get_lines(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('lines'), body: request)
      end

      # Generate astrocartography map
      # @param request [Hash] Subject birth data and map options
      # @return [Hash] World map with lines
      def generate_map(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('map'), body: request)
      end

      # Generate paran map
      # @param request [Hash] Subject birth data
      # @return [Hash] Line crossing points
      def generate_paran_map(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('paran-map'), body: request)
      end

      # Analyze specific location
      # @param request [Hash] Subject and location
      # @return [Hash] Location influences
      def analyze_location(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('location-analysis'), body: request)
      end

      # Compare multiple locations
      # @param request [Hash] Subject and locations
      # @return [Hash] Multi-location comparison
      def compare_locations(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('compare-locations'), body: request)
      end

      # Find power zones
      # @param request [Hash] Subject and criteria
      # @return [Hash] Optimal geographic areas
      def find_power_zones(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('power-zones'), body: request)
      end

      # Search locations by criteria
      # @param request [Hash] Search criteria
      # @return [Hash] Matching locations
      def search_locations(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('search-locations'), body: request)
      end

      # Generate relocation chart
      # @param request [Hash] Subject and new location
      # @return [Hash] Chart for new location
      def generate_relocation_chart(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('relocation-chart'), body: request)
      end

      # Get line meanings
      # @param params [Hash] Query parameters
      # @return [Hash] Line interpretations
      def get_line_meanings(params = {})
        http.get(build_url('line-meanings'), params: params)
      end

      # Get supported features
      # @param params [Hash] Query parameters
      # @return [Hash] Available features
      def get_supported_features(params = {})
        http.get(build_url('supported-features'), params: params)
      end

      # Calculate astrodynes
      # @param request [Hash] Subject birth data
      # @return [Hash] Astrodyne calculations
      def calculate_astrodynes(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('astrodynes'), body: request)
      end

      # Compare astrodynes for multiple locations
      # @param request [Hash] Subject and locations
      # @return [Hash] Astrodyne comparison
      def compare_astrodynes(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('astrodynes', 'compare'), body: request)
      end

      # Render astrocartography map image
      # @param request [Hash] Subject and render options
      # @return [Hash] Rendered map data
      def render_map(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('render'), body: request)
      end

      protected

      def api_prefix
        '/api/v3/astrocartography'
      end
    end
  end
end
