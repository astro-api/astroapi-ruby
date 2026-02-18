# frozen_string_literal: true

require_relative 'base_category'
require_relative '../validators/subject_validator'

module Astroapi
  module Categories
    # Kabbalah category client
    class Kabbalah < BaseCategory
      # Get birth angels
      # @param request [Hash] Subject birth data
      # @return [Hash] Guardian angels based on birth
      def get_birth_angels(request)
        Validators::SubjectValidator.validate!(request)
        http.post(build_url('birth-angels'), body: request)
      end

      # Calculate gematria
      # @param request [Hash] Name or text for analysis
      # @return [Hash] Gematria calculation
      def calculate_gematria(request)
        http.post(build_url('gematria'), body: request)
      end

      # Get tikkun
      # @param request [Hash] Subject birth data
      # @return [Hash] Soul correction analysis
      def get_tikkun(request)
        Validators::SubjectValidator.validate!(request)
        http.post(build_url('tikkun'), body: request)
      end

      # Get Tree of Life chart
      # @param request [Hash] Subject birth data
      # @return [Hash] Kabbalistic Tree of Life mapping
      def get_tree_of_life_chart(request)
        Validators::SubjectValidator.validate!(request)
        http.post(build_url('tree-of-life-chart'), body: request)
      end

      # Get 72 Angels glossary
      # @param params [Hash] Query parameters
      # @return [Hash] Angels reference
      def get_angels_glossary(params = {})
        http.get(build_url('glossary', 'angels-72'), params: params)
      end

      # Get Hebrew letters glossary
      # @param params [Hash] Query parameters
      # @return [Hash] Hebrew letters reference
      def get_hebrew_letters_glossary(params = {})
        http.get(build_url('glossary', 'hebrew-letters'), params: params)
      end

      # Get Sephiroth glossary
      # @param params [Hash] Query parameters
      # @return [Hash] Sephiroth reference
      def get_sephiroth_glossary(params = {})
        http.get(build_url('glossary', 'sephiroth'), params: params)
      end

      protected

      def api_prefix
        '/api/v3/kabbalah'
      end
    end
  end
end
