# frozen_string_literal: true

require_relative 'base_category'
require_relative 'insights/relationship'
require_relative 'insights/pet'
require_relative 'insights/wellness'
require_relative 'insights/financial'
require_relative 'insights/business'

module Astroapi
  module Categories
    # Insights category client with specialized sub-clients
    class InsightsCategory < BaseCategory
      attr_reader :relationship, :pet, :wellness, :financial, :business

      def initialize(http_client)
        super(http_client)

        # Initialize sub-clients
        @relationship = Insights::Relationship.new(http_client)
        @pet = Insights::Pet.new(http_client)
        @wellness = Insights::Wellness.new(http_client)
        @financial = Insights::Financial.new(http_client)
        @business = Insights::Business.new(http_client)
      end

      # Discover available insights
      # @param params [Hash] Query parameters
      # @return [Hash] List of available insights
      def discover(params = {})
        http.get(build_url, params: params)
      end

      protected

      def api_prefix
        '/api/v3/insights'
      end
    end
  end
end
