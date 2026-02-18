# frozen_string_literal: true

require_relative '../base_category'

module Astroapi
  module Categories
    module Insights
      # Pet insights sub-client
      class Pet < BaseCategory
        # Get pet personality
        # @param request [Hash] Pet birth data
        # @return [Hash] Pet personality analysis
        def get_personality(request)
          http.post(build_url('personality'), body: request)
        end

        # Get owner-pet compatibility
        # @param request [Hash] Owner and pet birth data
        # @return [Hash] Compatibility analysis
        def get_compatibility(request)
          http.post(build_url('compatibility'), body: request)
        end

        # Get training windows
        # @param request [Hash] Pet birth data and date range
        # @return [Hash] Optimal training times
        def get_training_windows(request)
          http.post(build_url('training-windows'), body: request)
        end

        # Get health sensitivities
        # @param request [Hash] Pet birth data
        # @return [Hash] Health sensitivity analysis
        def get_health_sensitivities(request)
          http.post(build_url('health-sensitivities'), body: request)
        end

        # Get multi-pet dynamics
        # @param request [Hash] Multiple pets' birth data
        # @return [Hash] Multi-pet interaction analysis
        def get_multi_pet_dynamics(request)
          http.post(build_url('multi-pet-dynamics'), body: request)
        end

        protected

        def api_prefix
          '/api/v3/insights/pet'
        end
      end
    end
  end
end
