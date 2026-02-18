# frozen_string_literal: true

require_relative 'base_category'

module Astroapi
  module Categories
    # Glossary category client for reference data and lookups
    class Glossary < BaseCategory
      # Get all active points
      # @param params [Hash] Query parameters
      # @return [Hash] All astrological points
      def get_active_points(params = {})
        http.get(build_url('active-points'), params: params)
      end

      # Get primary active points
      # @param params [Hash] Query parameters
      # @return [Hash] Main planets
      def get_primary_active_points(params = {})
        http.get(build_url('active-points', 'primary'), params: params)
      end

      # Get cities
      # @param params [Hash] Query parameters for search
      # @return [Hash] City search results (paginated)
      def get_cities(params = {})
        http.get(build_url('cities'), params: params)
      end

      # Get countries
      # @param params [Hash] Query parameters
      # @return [Hash] ISO country codes
      def get_countries(params = {})
        http.get(build_url('countries'), params: params)
      end

      # Get elements
      # @param params [Hash] Query parameters
      # @return [Hash] Fire, Earth, Air, Water
      def get_elements(params = {})
        http.get(build_url('elements'), params: params)
      end

      # Get fixed stars
      # @param params [Hash] Query parameters
      # @return [Hash] Fixed star catalog
      def get_fixed_stars(params = {})
        http.get(build_url('fixed-stars'), params: params)
      end

      # Get house systems
      # @param params [Hash] Query parameters
      # @return [Hash] Placidus, Whole Sign, etc.
      def get_house_systems(params = {})
        http.get(build_url('house-systems'), params: params)
      end

      # Get houses
      # @param params [Hash] Query parameters
      # @return [Hash] House meanings
      def get_houses(params = {})
        http.get(build_url('houses'), params: params)
      end

      # Get keywords
      # @param params [Hash] Query parameters
      # @return [Hash] Astrological keywords
      def get_keywords(params = {})
        http.get(build_url('keywords'), params: params)
      end

      # Get supported languages
      # @param params [Hash] Query parameters
      # @return [Hash] Supported languages
      def get_languages(params = {})
        http.get(build_url('languages'), params: params)
      end

      # Get life areas
      # @param params [Hash] Query parameters
      # @return [Hash] Life area descriptions
      def get_life_areas(params = {})
        http.get(build_url('life-areas'), params: params)
      end

      # Get themes
      # @param params [Hash] Query parameters
      # @return [Hash] Chart styling themes
      def get_themes(params = {})
        http.get(build_url('themes'), params: params)
      end

      # Get zodiac types
      # @param params [Hash] Query parameters
      # @return [Hash] Tropical, Sidereal
      def get_zodiac_types(params = {})
        http.get(build_url('zodiac-types'), params: params)
      end

      # Get horary categories
      # @param params [Hash] Query parameters
      # @return [Hash] Horary question categories
      def get_horary_categories(params = {})
        http.get(build_url('horary-categories'), params: params)
      end

      protected

      def api_prefix
        '/api/v3/glossary'
      end
    end
  end
end
