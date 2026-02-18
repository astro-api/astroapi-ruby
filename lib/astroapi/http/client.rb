# frozen_string_literal: true

require 'faraday'
require 'faraday/retry'
require_relative 'middleware/authentication'
require_relative 'middleware/response_unwrapper'
require_relative 'middleware/logger'

module Astroapi
  module HTTP
    # HTTP client wrapper using Faraday
    class Client
      attr_reader :config

      def initialize(config)
        @config = config
        @connection = build_connection
      end

      # Make a GET request
      # @param path [String] Request path
      # @param params [Hash] Query parameters
      # @return [Hash] Response body
      def get(path, params: {})
        response = @connection.get(path, params)
        response.body
      rescue Faraday::Error => e
        raise Astroapi::Error.from_faraday_error(e)
      end

      # Make a POST request
      # @param path [String] Request path
      # @param body [Hash] Request body
      # @return [Hash] Response body
      def post(path, body: {})
        response = @connection.post(path) do |req|
          req.body = body.to_json
        end
        response.body
      rescue Faraday::Error => e
        raise Astroapi::Error.from_faraday_error(e)
      end

      # Make a PUT request
      # @param path [String] Request path
      # @param body [Hash] Request body
      # @return [Hash] Response body
      def put(path, body: {})
        response = @connection.put(path) do |req|
          req.body = body.to_json
        end
        response.body
      rescue Faraday::Error => e
        raise Astroapi::Error.from_faraday_error(e)
      end

      # Make a DELETE request
      # @param path [String] Request path
      # @return [Hash] Response body
      def delete(path)
        response = @connection.delete(path)
        response.body
      rescue Faraday::Error => e
        raise Astroapi::Error.from_faraday_error(e)
      end

      private

      def build_connection
        Faraday.new(url: @config.base_url) do |faraday|
          # Request middleware
          faraday.request :json

          # Custom middleware
          faraday.use Middleware::Authentication, @config
          faraday.use Middleware::Logger, @config

          # Retry middleware (if configured)
          if @config.retry.attempts.positive?
            faraday.request :retry,
                            max: @config.retry.attempts,
                            interval: (@config.retry.delay_ms / 1000.0),
                            retry_statuses: @config.retry.retry_status_codes,
                            methods: %i[get post put delete],
                            exceptions: [
                              Faraday::TimeoutError,
                              Faraday::ConnectionFailed,
                              Errno::ETIMEDOUT,
                              Errno::ECONNREFUSED
                            ]
          end

          # Response middleware (runs in reverse order for responses)
          faraday.use Middleware::ResponseUnwrapper
          faraday.response :raise_error
          faraday.response :json, content_type: /\bjson$/

          # Adapter
          faraday.adapter Faraday.default_adapter

          # Timeout
          faraday.options.timeout = @config.timeout
          faraday.options.open_timeout = @config.timeout
        end
      end
    end
  end
end
