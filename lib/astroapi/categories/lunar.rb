# frozen_string_literal: true

require_relative 'base_category'

module Astroapi
  module Categories
    # Lunar category client for Moon phases and lunar data
    class Lunar < BaseCategory
      # Get moon phases in date range
      # @param request [Hash] Date range
      # @return [Hash] Moon phases
      def get_phases(request)
        http.post(build_url('phases'), body: request)
      end

      # Get lunar events
      # @param request [Hash] Date range
      # @return [Hash] Lunar ingresses and aspects
      def get_events(request)
        http.post(build_url('events'), body: request)
      end

      # Get lunar mansions
      # @param request [Hash] Date and location
      # @return [Hash] 28 lunar mansions
      def get_mansions(request)
        http.post(build_url('mansions'), body: request)
      end

      # Get void of course periods
      # @param request [Hash] Date range
      # @return [Hash] Void-of-course periods
      def get_void_of_course(request)
        http.post(build_url('void-of-course'), body: request)
      end

      # Get annual lunar calendar
      # @param year [Integer] Year
      # @return [Hash] Lunar calendar
      def get_calendar(year)
        http.get(build_url('calendar', year.to_s))
      end

      protected

      def api_prefix
        '/api/v3/lunar'
      end
    end
  end
end
