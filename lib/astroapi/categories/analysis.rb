# frozen_string_literal: true

require_relative 'base_category'
require_relative '../validators/subject_validator'

module Astroapi
  module Categories
    # Analysis category client for interpretive reports and analyses
    class Analysis < BaseCategory
      # Get natal report
      # @param request [Hash] Subject birth data
      # @return [Hash] Comprehensive natal interpretation
      def get_natal_report(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('natal-report'), body: request)
      end

      # Get synastry report
      # @param request [Hash] Two subjects' birth data
      # @return [Hash] Relationship analysis
      def get_synastry_report(request)
        http.post(build_url('synastry-report'), body: request)
      end

      # Get composite report
      # @param request [Hash] Two subjects' birth data
      # @return [Hash] Composite chart interpretation
      def get_composite_report(request)
        http.post(build_url('composite-report'), body: request)
      end

      # Get compatibility analysis
      # @param request [Hash] Two subjects' birth data
      # @return [Hash] Compatibility assessment
      def get_compatibility_analysis(request)
        http.post(build_url('compatibility'), body: request)
      end

      # Get compatibility score
      # @param request [Hash] Two subjects' birth data
      # @return [Hash] Numeric compatibility score
      def get_compatibility_score(request)
        http.post(build_url('compatibility-score'), body: request)
      end

      # Get relationship analysis
      # @param request [Hash] Two subjects' birth data
      # @return [Hash] Relationship dynamics
      def get_relationship_analysis(request)
        http.post(build_url('relationship'), body: request)
      end

      # Get relationship score
      # @param request [Hash] Two subjects' birth data
      # @return [Hash] Numeric relationship score
      def get_relationship_score(request)
        http.post(build_url('relationship-score'), body: request)
      end

      # Get transit report
      # @param request [Hash] Subject and transit date
      # @return [Hash] Transit interpretations
      def get_transit_report(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('transit-report'), body: request)
      end

      # Get natal transit report
      # @param request [Hash] Subject and date range
      # @return [Hash] Natal transit interpretations
      def get_natal_transit_report(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('natal-transit-report'), body: request)
      end

      # Get progression report
      # @param request [Hash] Subject and progression date
      # @return [Hash] Progression interpretations
      def get_progression_report(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('progression-report'), body: request)
      end

      # Get direction report
      # @param request [Hash] Subject and direction date
      # @return [Hash] Direction interpretations
      def get_direction_report(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('direction-report'), body: request)
      end

      # Get lunar return report
      # @param request [Hash] Subject and date
      # @return [Hash] Monthly themes
      def get_lunar_return_report(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('lunar-return-report'), body: request)
      end

      # Get solar return report
      # @param request [Hash] Subject and year
      # @return [Hash] Yearly themes
      def get_solar_return_report(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('solar-return-report'), body: request)
      end

      # Get lunar return transit report
      # @param request [Hash] Subject and date range
      # @return [Hash] LR transit events
      def get_lunar_return_transit_report(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('lunar-return-transit-report'), body: request)
      end

      # Get solar return transit report
      # @param request [Hash] Subject and year
      # @return [Hash] SR transit events
      def get_solar_return_transit_report(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('solar-return-transit-report'), body: request)
      end

      # Get career analysis
      # @param request [Hash] Subject birth data
      # @return [Hash] 10th house/career focus
      def get_career_analysis(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('career'), body: request)
      end

      # Get health analysis
      # @param request [Hash] Subject birth data
      # @return [Hash] 6th house/wellness focus
      def get_health_analysis(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('health'), body: request)
      end

      # Get karmic analysis
      # @param request [Hash] Subject birth data
      # @return [Hash] Past life/soul lessons
      def get_karmic_analysis(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('karmic'), body: request)
      end

      # Get psychological analysis
      # @param request [Hash] Subject birth data
      # @return [Hash] Psychological patterns
      def get_psychological_analysis(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('psychological'), body: request)
      end

      # Get spiritual analysis
      # @param request [Hash] Subject birth data
      # @return [Hash] Spiritual path
      def get_spiritual_analysis(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('spiritual'), body: request)
      end

      # Get predictive analysis
      # @param request [Hash] Subject and time period
      # @return [Hash] Future trends
      def get_predictive_analysis(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('predictive'), body: request)
      end

      # Get vocational analysis
      # @param request [Hash] Subject birth data
      # @return [Hash] Career aptitudes
      def get_vocational_analysis(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('vocational'), body: request)
      end

      # Get lunar analysis
      # @param request [Hash] Subject birth data
      # @return [Hash] Moon-focused analysis
      def get_lunar_analysis(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('lunar-analysis'), body: request)
      end

      # Get relocation analysis
      # @param request [Hash] Subject and new location
      # @return [Hash] Geographic relocation analysis
      def get_relocation_analysis(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('relocation'), body: request)
      end

      # Get Venus return report
      # @param request [Hash] Subject and return date
      # @return [Hash] Venus return interpretation
      def get_venus_return_report(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('venus-return-report'), body: request)
      end

      # Get Venus return transit report
      # @param request [Hash] Subject and date range
      # @return [Hash] Venus return transit events
      def get_venus_return_transit_report(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('venus-return-transit-report'), body: request)
      end

      protected

      def api_prefix
        '/api/v3/analysis'
      end
    end
  end
end
