# frozen_string_literal: true

require_relative 'base_category'
require_relative '../validators/subject_validator'

module Astroapi
  module Categories
    # SVG category client for SVG chart image generation
    # Note: Returns SVG strings (text), not JSON
    class Svg < BaseCategory
      # Get natal chart SVG
      # @param request [Hash] Subject birth data and options
      # @return [String] SVG chart as text
      def get_natal_chart_svg(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('natal'), body: request)
      end

      # Get synastry chart SVG
      # @param request [Hash] Two subjects' birth data and options
      # @return [String] SVG chart as text
      def get_synastry_chart_svg(request)
        http.post(build_url('synastry'), body: request)
      end

      # Get composite chart SVG
      # @param request [Hash] Two subjects' birth data and options
      # @return [String] SVG chart as text
      def get_composite_chart_svg(request)
        http.post(build_url('composite'), body: request)
      end

      # Get transit chart SVG
      # @param request [Hash] Subject, transit date and options
      # @return [String] SVG chart as text
      def get_transit_chart_svg(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('transit'), body: request)
      end

      protected

      def api_prefix
        '/api/v3/svg'
      end
    end
  end
end
