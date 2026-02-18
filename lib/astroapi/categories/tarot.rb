# frozen_string_literal: true

require_relative 'base_category'
require_relative '../validators/subject_validator'

module Astroapi
  module Categories
    # Tarot category client for tarot readings and analysis
    class Tarot < BaseCategory
      # Get cards glossary
      # @param params [Hash] Query parameters
      # @return [Hash] 78 cards reference
      def get_cards_glossary(params = {})
        http.get(build_url('glossary', 'cards'), params: params)
      end

      # Get spreads glossary
      # @param params [Hash] Query parameters
      # @return [Hash] Spread types
      def get_spreads_glossary(params = {})
        http.get(build_url('glossary', 'spreads'), params: params)
      end

      # Get card details
      # @param card_id [String] Card ID
      # @return [Hash] Card details
      def get_card_details(card_id)
        http.get(build_url('glossary', 'cards', card_id))
      end

      # Draw cards
      # @param request [Hash] Number of cards and options
      # @return [Hash] Random card draw
      def draw_cards(request)
        http.post(build_url('cards', 'draw'), body: request)
      end

      # Search cards
      # @param params [Hash] Search keywords
      # @return [Hash] Matching cards
      def search_cards(params = {})
        http.get(build_url('cards', 'search'), params: params)
      end

      # Get daily card
      # @param params [Hash] Query parameters
      # @return [Hash] Daily card
      def get_daily_card(params = {})
        http.get(build_url('cards', 'daily'), params: params)
      end

      # Generate single card report
      # @param request [Hash] Card and question
      # @return [Hash] Single card reading
      def generate_single_report(request)
        http.post(build_url('reports', 'single'), body: request)
      end

      # Generate three card report
      # @param request [Hash] Three cards
      # @return [Hash] Past/present/future reading
      def generate_three_card_report(request)
        http.post(build_url('reports', 'three-card'), body: request)
      end

      # Generate Celtic Cross report
      # @param request [Hash] Ten cards
      # @return [Hash] 10-card spread
      def generate_celtic_cross_report(request)
        http.post(build_url('reports', 'celtic-cross'), body: request)
      end

      # Generate synastry report
      # @param request [Hash] Cards and two subjects
      # @return [Hash] Relationship reading
      def generate_synastry_report(request)
        http.post(build_url('reports', 'synastry'), body: request)
      end

      # Generate houses report
      # @param request [Hash] Cards for 12 houses
      # @return [Hash] 12-house spread
      def generate_houses_report(request)
        http.post(build_url('reports', 'houses'), body: request)
      end

      # Generate Tree of Life report
      # @param request [Hash] Cards for Kabbalah spread
      # @return [Hash] Tree of Life spread
      def generate_tree_of_life_report(request)
        http.post(build_url('reports', 'tree-of-life'), body: request)
      end

      # Calculate quintessence
      # @param request [Hash] Cards for synthesis
      # @return [Hash] Synthesis card
      def calculate_quintessence(request)
        http.post(build_url('analysis', 'quintessence'), body: request)
      end

      # Calculate birth cards
      # @param request [Hash] Birth date
      # @return [Hash] Personality/soul cards
      def calculate_birth_cards(request)
        http.post(build_url('analysis', 'birth-cards'), body: request)
      end

      # Calculate elemental dignities
      # @param request [Hash] Cards for analysis
      # @return [Hash] Elemental interactions
      def calculate_elemental_dignities(request)
        http.post(build_url('analysis', 'dignities'), body: request)
      end

      # Analyze timing
      # @param request [Hash] Cards and question
      # @return [Hash] Timing implications
      def analyze_timing(request)
        http.post(build_url('analysis', 'timing'), body: request)
      end

      # Calculate optimal times
      # @param request [Hash] Cards and date range
      # @return [Hash] Best timing windows
      def calculate_optimal_times(request)
        http.post(build_url('analysis', 'optimal-times'), body: request)
      end

      # Generate transit report
      # @param request [Hash] Birth data and cards
      # @return [Hash] Astro-tarot transit
      def generate_transit_report(request)
        if request[:subject] || request['subject']
          Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        end
        http.post(build_url('analysis', 'transit-report'), body: request)
      end

      # Generate natal report
      # @param request [Hash] Birth data and cards
      # @return [Hash] Astro-tarot natal
      def generate_natal_report(request)
        if request[:subject] || request['subject']
          Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        end
        http.post(build_url('analysis', 'natal-report'), body: request)
      end

      protected

      def api_prefix
        '/api/v3/tarot'
      end
    end
  end
end
