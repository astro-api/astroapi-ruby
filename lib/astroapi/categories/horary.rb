# frozen_string_literal: true

require_relative 'base_category'

module Astroapi
  module Categories
    # Horary astrology category client
    class Horary < BaseCategory
      # Generate horary chart
      # @param request [Hash] Question time and location
      # @return [Hash] Horary chart data
      def generate_chart(request)
        http.post(build_url('chart'), body: request)
      end

      # Analyze horary question
      # @param request [Hash] Chart data and question
      # @return [Hash] Horary analysis
      def analyze(request)
        http.post(build_url('analyze'), body: request)
      end

      # Get horary aspects
      # @param request [Hash] Chart data
      # @return [Hash] Horary-specific aspects
      def get_aspects(request)
        http.post(build_url('aspects'), body: request)
      end

      # Analyze fertility question
      # @param request [Hash] Chart data
      # @return [Hash] Fertility analysis
      def analyze_fertility(request)
        http.post(build_url('fertility-analysis'), body: request)
      end

      # Get categories glossary
      # @param params [Hash] Query parameters
      # @return [Hash] Horary categories reference
      def get_categories_glossary(params = {})
        http.get(build_url('glossary', 'categories'), params: params)
      end

      # Get considerations glossary
      # @param params [Hash] Query parameters
      # @return [Hash] Considerations before judgment
      def get_considerations_glossary(params = {})
        http.get(build_url('glossary', 'considerations'), params: params)
      end

      protected

      def api_prefix
        '/api/v3/horary'
      end
    end
  end
end
