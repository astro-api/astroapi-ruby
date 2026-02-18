# frozen_string_literal: true

require_relative 'base_category'
require_relative '../validators/subject_validator'

module Astroapi
  module Categories
    # Horoscope category client for daily/weekly/monthly horoscopes
    class Horoscope < BaseCategory
      # Get personalized daily horoscope
      # @param request [Hash] Subject birth data
      # @return [Hash] Personalized daily horoscope
      def get_personal_daily_horoscope(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('personal', 'daily'), body: request)
      end

      # Get personalized daily horoscope text
      # @param request [Hash] Subject birth data
      # @return [Hash] Formatted horoscope text
      def get_personal_daily_horoscope_text(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('personal', 'daily', 'text'), body: request)
      end

      # Get sign daily horoscope
      # @param request [Hash] Sun sign and date
      # @return [Hash] Daily horoscope by sun sign
      def get_sign_daily_horoscope(request)
        http.post(build_url('sign', 'daily'), body: request)
      end

      # Get sign daily horoscope text
      # @param request [Hash] Sun sign and date
      # @return [Hash] Formatted daily text
      def get_sign_daily_horoscope_text(request)
        http.post(build_url('sign', 'daily', 'text'), body: request)
      end

      # Get sign weekly horoscope
      # @param request [Hash] Sun sign and week
      # @return [Hash] Weekly horoscope by sun sign
      def get_sign_weekly_horoscope(request)
        http.post(build_url('sign', 'weekly'), body: request)
      end

      # Get sign weekly horoscope text
      # @param request [Hash] Sun sign and week
      # @return [Hash] Formatted weekly text
      def get_sign_weekly_horoscope_text(request)
        http.post(build_url('sign', 'weekly', 'text'), body: request)
      end

      # Get sign monthly horoscope
      # @param request [Hash] Sun sign and month
      # @return [Hash] Monthly horoscope by sun sign
      def get_sign_monthly_horoscope(request)
        http.post(build_url('sign', 'monthly'), body: request)
      end

      # Get sign monthly horoscope text
      # @param request [Hash] Sun sign and month
      # @return [Hash] Formatted monthly text
      def get_sign_monthly_horoscope_text(request)
        http.post(build_url('sign', 'monthly', 'text'), body: request)
      end

      # Get sign yearly horoscope
      # @param request [Hash] Sun sign and year
      # @return [Hash] Yearly overview by sun sign
      def get_sign_yearly_horoscope(request)
        http.post(build_url('sign', 'yearly'), body: request)
      end

      # Get sign yearly horoscope text
      # @param request [Hash] Sun sign and year
      # @return [Hash] Formatted yearly text
      def get_sign_yearly_horoscope_text(request)
        http.post(build_url('sign', 'yearly', 'text'), body: request)
      end

      # Get personalized weekly horoscope
      # @param request [Hash] Subject birth data
      # @return [Hash] Personalized weekly horoscope
      def get_personal_weekly_horoscope(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('personal', 'weekly'), body: request)
      end

      # Get personalized weekly horoscope text
      # @param request [Hash] Subject birth data
      # @return [Hash] Formatted weekly horoscope text
      def get_personal_weekly_horoscope_text(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('personal', 'weekly', 'text'), body: request)
      end

      # Get personalized monthly horoscope
      # @param request [Hash] Subject birth data
      # @return [Hash] Personalized monthly horoscope
      def get_personal_monthly_horoscope(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('personal', 'monthly'), body: request)
      end

      # Get personalized monthly horoscope text
      # @param request [Hash] Subject birth data
      # @return [Hash] Formatted monthly horoscope text
      def get_personal_monthly_horoscope_text(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('personal', 'monthly', 'text'), body: request)
      end

      # Get personalized yearly horoscope
      # @param request [Hash] Subject birth data
      # @return [Hash] Personalized yearly horoscope
      def get_personal_yearly_horoscope(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('personal', 'yearly'), body: request)
      end

      # Get personalized yearly horoscope text
      # @param request [Hash] Subject birth data
      # @return [Hash] Formatted yearly horoscope text
      def get_personal_yearly_horoscope_text(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('personal', 'yearly', 'text'), body: request)
      end

      # Get Chinese horoscope
      # @param request [Hash] Birth data for BaZi
      # @return [Hash] Chinese horoscope
      def get_chinese_horoscope(request)
        http.post(build_url('chinese', 'bazi'), body: request)
      end

      protected

      def api_prefix
        '/api/v3/horoscope'
      end
    end
  end
end
