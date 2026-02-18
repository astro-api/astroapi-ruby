# frozen_string_literal: true

module Astroapi
  module Categories
    # Base class for all category clients
    class BaseCategory
      attr_reader :http

      def initialize(http_client)
        @http = http_client
      end

      protected

      # Build URL path from segments
      # @param segments [Array<String>] Path segments
      # @return [String] Full path
      def build_url(*segments)
        path_segments = [api_prefix, *segments.compact].map { |s| s.to_s.gsub(%r{^/+|/+$}, '') }
        "/#{path_segments.join('/')}"
      end

      # API prefix for this category (must be overridden)
      # @return [String]
      def api_prefix
        raise NotImplementedError, 'Subclasses must define api_prefix'
      end
    end
  end
end
