# frozen_string_literal: true

require_relative 'base_category'
require_relative '../validators/subject_validator'

module Astroapi
  module Categories
    # Data category client for planetary positions, aspects, house cusps, etc.
    class Data < BaseCategory
      # Get planetary positions
      # @example
      #   positions = client.data.get_positions(
      #     subject: {
      #       birth_data: {
      #         year: 1990, month: 5, day: 11,
      #         hour: 14, minute: 30,
      #         city: 'London', country_code: 'GB'
      #       }
      #     }
      #   )
      #
      # @param request [Hash] Subject birth data
      # @option request [Hash] :subject Subject with birth_data
      # @return [Hash] Planetary positions with signs, degrees, retrograde status
      # @raise [Astroapi::ValidationError] if request data is invalid
      def get_positions(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('positions'), body: request)
      end

      # Get enhanced planetary positions with additional data
      # @param request [Hash] Subject birth data
      # @return [Hash] Enhanced planetary positions
      def get_enhanced_positions(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('positions', 'enhanced'), body: request)
      end

      # Get global planetary positions (without subject)
      # @param request [Hash] Request options
      # @option request [String] :date ISO date string (optional)
      # @return [Hash] Global planetary positions
      def get_global_positions(request = {})
        http.post(build_url('global-positions'), body: request)
      end

      # Get planetary aspects
      # @param request [Hash] Subject birth data
      # @return [Hash] Planetary aspects
      def get_aspects(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('aspects'), body: request)
      end

      # Get enhanced planetary aspects
      # @param request [Hash] Subject birth data
      # @return [Hash] Enhanced planetary aspects
      def get_enhanced_aspects(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('aspects', 'enhanced'), body: request)
      end

      # Get house cusps
      # @param request [Hash] Subject birth data
      # @return [Hash] House cusps data
      def get_house_cusps(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('house-cusps'), body: request)
      end

      # Get lunar metrics
      # @param request [Hash] Subject birth data
      # @return [Hash] Lunar phase, illumination, etc.
      def get_lunar_metrics(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('lunar-metrics'), body: request)
      end

      # Get enhanced lunar metrics
      # @param request [Hash] Subject birth data
      # @return [Hash] Enhanced lunar metrics
      def get_enhanced_lunar_metrics(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('lunar-metrics', 'enhanced'), body: request)
      end

      # Get current moment (planetary positions at current time)
      # @return [Hash] Current planetary positions
      def get_current_moment
        http.get(build_url('now'))
      end

      protected

      def api_prefix
        '/api/v3/data'
      end
    end
  end
end
