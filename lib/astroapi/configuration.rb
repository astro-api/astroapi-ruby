# frozen_string_literal: true

require 'logger'

module Astroapi
  # Configuration for the Astroapi client
  class Configuration
    DEFAULT_BASE_URL = 'https://api.astrology-api.io'
    DEFAULT_TIMEOUT = 10
    DEFAULT_RETRY_STATUS_CODES = [408, 425, 429, 500, 502, 503, 504].freeze

    attr_accessor :api_key, :base_url, :timeout, :debug, :logger
    attr_reader :retry

    def initialize
      @api_key = ENV.fetch('ASTROLOGY_API_KEY', nil)
      @base_url = ENV.fetch('ASTROLOGY_API_BASE_URL', DEFAULT_BASE_URL)
      @timeout = DEFAULT_TIMEOUT
      @debug = parse_boolean(ENV.fetch('ASTROLOGY_DEBUG', nil))
      @logger = Logger.new($stdout)
      @logger.level = Logger::INFO
      @retry = RetryConfig.new
    end

    # Retry configuration
    class RetryConfig
      attr_accessor :attempts, :delay_ms, :retry_status_codes

      def initialize
        @attempts = 0
        @delay_ms = 250
        @retry_status_codes = DEFAULT_RETRY_STATUS_CODES.dup
      end
    end

    private

    def parse_boolean(value)
      return false if value.nil? || value.empty?

      %w[true 1 yes on].include?(value.to_s.downcase)
    end
  end
end
