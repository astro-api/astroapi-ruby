# frozen_string_literal: true

require_relative 'base_category'
require_relative '../validators/subject_validator'

module Astroapi
  module Categories
    # Fixed stars astrology category client
    class FixedStars < BaseCategory
      # Get fixed star positions
      # @param request [Hash] Date and time
      # @return [Hash] Star positions
      def get_positions(request)
        http.post(build_url('positions'), body: request)
      end

      # Get conjunctions
      # @param request [Hash] Subject birth data
      # @return [Hash] Stars conjunct natal planets
      def get_conjunctions(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('conjunctions'), body: request)
      end

      # Generate report
      # @param request [Hash] Subject birth data
      # @return [Hash] Fixed stars interpretation
      def generate_report(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('report'), body: request)
      end

      # Get presets
      # @param params [Hash] Query parameters
      # @return [Hash] Royal Stars, Behenian, etc.
      def get_presets(params = {})
        http.get(build_url('presets'), params: params)
      end

      protected

      def api_prefix
        '/api/v3/fixed-stars'
      end
    end
  end
end
