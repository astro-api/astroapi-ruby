# frozen_string_literal: true

require_relative 'base_category'
require_relative '../validators/subject_validator'

module Astroapi
  module Categories
    # Charts category client for astrological chart generation
    class Charts < BaseCategory
      # Get natal chart
      # @param request [Hash] Subject birth data
      # @return [Hash] Natal chart data
      def get_natal_chart(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('natal'), body: request)
      end

      # Get composite chart
      # @param request [Hash] Two subjects' birth data
      # @return [Hash] Composite chart data
      def get_composite_chart(request)
        http.post(build_url('composite'), body: request)
      end

      # Get synastry chart
      # @param request [Hash] Two subjects' birth data
      # @return [Hash] Synastry chart data
      def get_synastry_chart(request)
        http.post(build_url('synastry'), body: request)
      end

      # Get transit chart
      # @param request [Hash] Subject and transit date
      # @return [Hash] Transit chart data
      def get_transit_chart(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('transit'), body: request)
      end

      # Get solar return chart
      # @param request [Hash] Subject and return year
      # @return [Hash] Solar return chart data
      def get_solar_return_chart(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('solar-return'), body: request)
      end

      # Get lunar return chart
      # @param request [Hash] Subject and return date
      # @return [Hash] Lunar return chart data
      def get_lunar_return_chart(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('lunar-return'), body: request)
      end

      # Get solar return transits
      # @param request [Hash] Subject and year
      # @return [Hash] Solar return transit events
      def get_solar_return_transits(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('solar-return-transits'), body: request)
      end

      # Get lunar return transits
      # @param request [Hash] Subject and date range
      # @return [Hash] Lunar return transit events
      def get_lunar_return_transits(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('lunar-return-transits'), body: request)
      end

      # Get progressions
      # @param request [Hash] Subject and progression date
      # @return [Hash] Secondary/tertiary progressions
      def get_progressions(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('progressions'), body: request)
      end

      # Get directions
      # @param request [Hash] Subject and direction date
      # @return [Hash] Solar arc directions
      def get_directions(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('directions'), body: request)
      end

      # Get natal transits
      # @param request [Hash] Subject and date range
      # @return [Hash] Upcoming transit events
      def get_natal_transits(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('natal-transits'), body: request)
      end

      # Get Venus return chart
      # @param request [Hash] Subject and return date
      # @return [Hash] Venus return chart data
      def get_venus_return_chart(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('venus-return'), body: request)
      end

      # Get Venus return transits
      # @param request [Hash] Subject and date range
      # @return [Hash] Venus return transit events
      def get_venus_return_transits(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('venus-return-transits'), body: request)
      end

      protected

      def api_prefix
        '/api/v3/charts'
      end
    end
  end
end
