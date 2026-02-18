# frozen_string_literal: true

require_relative '../base_category'
require_relative '../../validators/subject_validator'

module Astroapi
  module Categories
    module Insights
      # Business insights sub-client
      class Business < BaseCategory
        # Get team dynamics
        # @param request [Hash] Multiple team members' birth data
        # @return [Hash] Team dynamics analysis
        def get_team_dynamics(request)
          http.post(build_url('team-dynamics'), body: request)
        end

        # Get hiring compatibility
        # @param request [Hash] Candidate and team/role data
        # @return [Hash] Hiring compatibility analysis
        def get_hiring_compatibility(request)
          http.post(build_url('hiring-compatibility'), body: request)
        end

        # Get leadership style
        # @param request [Hash] Subject birth data
        # @return [Hash] Leadership style analysis
        def get_leadership_style(request)
          Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
          http.post(build_url('leadership-style'), body: request)
        end

        # Get business timing
        # @param request [Hash] Business launch data and events
        # @return [Hash] Business timing analysis
        def get_business_timing(request)
          http.post(build_url('business-timing'), body: request)
        end

        # Get department compatibility
        # @param request [Hash] Department members' birth data
        # @return [Hash] Department compatibility
        def get_department_compatibility(request)
          http.post(build_url('department-compatibility'), body: request)
        end

        # Get succession planning
        # @param request [Hash] Current and potential leaders
        # @return [Hash] Succession planning analysis
        def get_succession_planning(request)
          http.post(build_url('succession-planning'), body: request)
        end

        protected

        def api_prefix
          '/api/v3/insights/business'
        end
      end
    end
  end
end
