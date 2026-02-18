# frozen_string_literal: true

require_relative '../base_category'
require_relative '../../validators/subject_validator'

module Astroapi
  module Categories
    module Insights
      # Wellness insights sub-client
      class Wellness < BaseCategory
        # Get body mapping
        # @param request [Hash] Subject birth data
        # @return [Hash] Body-astrology correspondences
        def get_body_mapping(request)
          Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
          http.post(build_url('body-mapping'), body: request)
        end

        # Get biorhythms
        # @param request [Hash] Subject and date range
        # @return [Hash] Physical/emotional/intellectual cycles
        def get_biorhythms(request)
          Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
          http.post(build_url('biorhythms'), body: request)
        end

        # Get wellness timing
        # @param request [Hash] Subject and date range
        # @return [Hash] Optimal wellness activity timing
        def get_wellness_timing(request)
          Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
          http.post(build_url('wellness-timing'), body: request)
        end

        # Get energy patterns
        # @param request [Hash] Subject birth data
        # @return [Hash] Energy level patterns
        def get_energy_patterns(request)
          Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
          http.post(build_url('energy-patterns'), body: request)
        end

        # Get wellness score
        # @param request [Hash] Subject and current date
        # @return [Hash] Current wellness score
        def get_wellness_score(request)
          Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
          http.post(build_url('wellness-score'), body: request)
        end

        # Get moon wellness
        # @param request [Hash] Subject and lunar phase
        # @return [Hash] Lunar wellness recommendations
        def get_moon_wellness(request)
          Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
          http.post(build_url('moon-wellness'), body: request)
        end

        protected

        def api_prefix
          '/api/v3/insights/wellness'
        end
      end
    end
  end
end
