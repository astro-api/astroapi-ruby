# frozen_string_literal: true

require_relative '../base_category'

module Astroapi
  module Categories
    module Insights
      # Relationship insights sub-client
      class Relationship < BaseCategory
        # Get compatibility
        # @param request [Hash] Two subjects' birth data
        # @return [Hash] Compatibility analysis
        def get_compatibility(request)
          http.post(build_url('compatibility'), body: request)
        end

        # Get compatibility score
        # @param request [Hash] Two subjects' birth data
        # @return [Hash] Numeric compatibility score
        def get_compatibility_score(request)
          http.post(build_url('compatibility-score'), body: request)
        end

        # Get love languages
        # @param request [Hash] Two subjects' birth data
        # @return [Hash] Love language analysis
        def get_love_languages(request)
          http.post(build_url('love-languages'), body: request)
        end

        # Get Davison report
        # @param request [Hash] Two subjects' birth data
        # @return [Hash] Davison relationship chart
        def get_davison_report(request)
          http.post(build_url('davison'), body: request)
        end

        # Get timing
        # @param request [Hash] Two subjects and date range
        # @return [Hash] Relationship timing analysis
        def get_timing(request)
          http.post(build_url('timing'), body: request)
        end

        # Get red flags
        # @param request [Hash] Two subjects' birth data
        # @return [Hash] Potential relationship challenges
        def get_red_flags(request)
          http.post(build_url('red-flags'), body: request)
        end

        # Discover relationship insights
        # @param params [Hash] Query parameters
        # @return [Hash] Available relationship insights
        def discover(params = {})
          http.get(build_url, params: params)
        end

        protected

        def api_prefix
          '/api/v3/insights/relationship'
        end
      end
    end
  end
end
