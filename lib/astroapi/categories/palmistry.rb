# frozen_string_literal: true

require_relative 'base_category'

module Astroapi
  module Categories
    # Palmistry category client
    class Palmistry < BaseCategory
      # Palm analysis (raw data)
      # @param request [Hash] Palm image or data
      # @return [Hash] Raw palm analysis data
      def analyze(request)
        http.post(build_url('analysis'), body: request)
      end

      # Palm reading (full interpretation)
      # @param request [Hash] Palm image or data
      # @return [Hash] Full palm reading
      def get_reading(request)
        http.post(build_url('reading'), body: request)
      end

      # Palm-astrology integration
      # @param request [Hash] Palm data and birth data
      # @return [Hash] Combined palm-astrology analysis
      def get_astro_integration(request)
        http.post(build_url('astro'), body: request)
      end

      # Palm compatibility analysis
      # @param request [Hash] Two palms data
      # @return [Hash] Compatibility analysis
      def get_compatibility(request)
        http.post(build_url('compatibility'), body: request)
      end

      protected

      def api_prefix
        '/api/v3/palmistry'
      end
    end
  end
end
