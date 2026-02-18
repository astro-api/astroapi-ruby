# frozen_string_literal: true

require_relative 'base_category'
require_relative '../validators/subject_validator'

module Astroapi
  module Categories
    # Vedic astrology category client
    class Vedic < BaseCategory
      # Get Vedic birth details
      # @param request [Hash] Subject birth data
      # @return [Hash] Vedic birth details
      def get_birth_details(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('birth-details'), body: request)
      end

      # Generate Vedic chart SVG
      # @param request [Hash] Subject birth data and options
      # @return [Hash] Vedic chart SVG
      def get_chart(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('chart'), body: request)
      end

      # Render Vedic chart in specified format
      # @param format [String] Output format (png, svg, etc.)
      # @param request [Hash] Subject birth data and options
      # @return [Hash] Rendered chart
      def render_chart(format, request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('chart', 'render', format), body: request)
      end

      # Get divisional charts
      # @param request [Hash] Subject birth data
      # @return [Hash] Divisional chart data
      def get_divisional_chart(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('divisional-chart'), body: request)
      end

      # Get Panchang
      # @param request [Hash] Date and location
      # @return [Hash] Daily Panchang
      def get_panchang(request)
        http.post(build_url('panchang'), body: request)
      end

      # Get regional Panchang
      # @param request [Hash] Date, location, and region
      # @return [Hash] Regional Panchang
      def get_regional_panchang(request)
        http.post(build_url('regional-panchang'), body: request)
      end

      # Calculate Ashtakvarga
      # @param request [Hash] Subject birth data
      # @return [Hash] Ashtakvarga strength analysis
      def calculate_ashtakvarga(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('ashtakvarga'), body: request)
      end

      # Calculate Shadbala
      # @param request [Hash] Subject birth data
      # @return [Hash] Six-fold strength analysis
      def calculate_shadbala(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('shadbala'), body: request)
      end

      # Get Vimshottari Dasha
      # @param request [Hash] Subject birth data
      # @return [Hash] Dasha periods
      def get_vimshottari_dasha(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('vimshottari-dasha'), body: request)
      end

      # Get Yogini Dasha
      # @param request [Hash] Subject birth data
      # @return [Hash] Yogini Dasha periods
      def get_yogini_dasha(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('yogini-dasha'), body: request)
      end

      # Calculate Chara Dasha
      # @param request [Hash] Subject birth data
      # @return [Hash] Chara Dasha periods
      def calculate_chara_dasha(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('chara-dasha'), body: request)
      end

      # Analyze yogas
      # @param request [Hash] Subject birth data
      # @return [Hash] Yoga analysis
      def analyze_yogas(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('yoga-analysis'), body: request)
      end

      # Get Nakshatra predictions
      # @param request [Hash] Subject birth data
      # @return [Hash] Nakshatra predictions
      def get_nakshatra_predictions(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('nakshatra-predictions'), body: request)
      end

      # Get Manglik Dosha
      # @param request [Hash] Subject birth data
      # @return [Hash] Manglik analysis
      def get_manglik_dosha(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('manglik-dosha'), body: request)
      end

      # Get Kaal Sarpa Dosha
      # @param request [Hash] Subject birth data
      # @return [Hash] Kaal Sarpa analysis
      def get_kaal_sarpa_dosha(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('kaal-sarpa-dosha'), body: request)
      end

      # Get Sade Sati
      # @param request [Hash] Subject birth data
      # @return [Hash] Sade Sati analysis
      def get_sade_sati(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('sade-sati'), body: request)
      end

      # Get Kundli matching
      # @param request [Hash] Two subjects' birth data
      # @return [Hash] Kundli matching results
      def get_kundli_matching(request)
        http.post(build_url('kundli-matching'), body: request)
      end

      # Get Vedic transit
      # @param request [Hash] Subject and transit date
      # @return [Hash] Vedic transit data
      def get_transit(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('transit'), body: request)
      end

      # Calculate Varshaphal
      # @param request [Hash] Subject and year
      # @return [Hash] Annual horoscope
      def calculate_varshaphal(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('varshaphal'), body: request)
      end

      # Get remedies
      # @param request [Hash] Subject birth data
      # @return [Hash] Suggested remedies
      def get_remedies(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('remedies'), body: request)
      end

      # Get festival calendar
      # @param request [Hash] Date range and location
      # @return [Hash] Hindu festival calendar
      def get_festival_calendar(request)
        http.post(build_url('festival-calendar'), body: request)
      end

      # Calculate KP system
      # @param request [Hash] Subject birth data
      # @return [Hash] KP system analysis
      def calculate_kp_system(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('kp-system'), body: request)
      end

      protected

      def api_prefix
        '/api/v3/vedic'
      end
    end
  end
end
