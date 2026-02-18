# frozen_string_literal: true

require_relative 'base_category'
require_relative '../validators/subject_validator'

module Astroapi
  module Categories
    # Chart rendering category client (PNG images)
    class Render < BaseCategory
      # Render natal chart
      # @param request [Hash] Subject birth data and render options
      # @return [Hash] Rendered chart image data
      def render_natal(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('natal'), body: request)
      end

      # Render synastry chart
      # @param request [Hash] Two subjects' birth data and render options
      # @return [Hash] Rendered synastry chart
      def render_synastry(request)
        http.post(build_url('synastry'), body: request)
      end

      # Render composite chart
      # @param request [Hash] Two subjects' birth data and render options
      # @return [Hash] Rendered composite chart
      def render_composite(request)
        http.post(build_url('composite'), body: request)
      end

      # Render transit chart
      # @param request [Hash] Subject and transit data with render options
      # @return [Hash] Rendered transit chart
      def render_transit(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('transit'), body: request)
      end

      protected

      def api_prefix
        '/api/v3/render'
      end
    end
  end
end
