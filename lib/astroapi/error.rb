# frozen_string_literal: true

module Astroapi
  # Base error class for all Astroapi errors
  class Error < StandardError
    attr_reader :status_code, :code, :details, :response

    def initialize(message, status_code: nil, code: nil, details: nil, response: nil)
      super(message)
      @status_code = status_code
      @code = code
      @details = details
      @response = response
    end

    # Check if error is a client error (4xx)
    # @return [Boolean]
    def client_error?
      return false unless status_code

      status_code >= 400 && status_code < 500
    end

    # Check if error is a server error (5xx)
    # @return [Boolean]
    def server_error?
      return false unless status_code

      status_code >= 500 && status_code < 600
    end

    # Convert a Faraday error to an Astroapi error
    # @param error [Faraday::Error] The Faraday error
    # @return [Astroapi::Error] Normalized error
    def self.from_faraday_error(error)
      case error
      when Faraday::TimeoutError
        TimeoutError.new(error.message, details: error)
      when Faraday::ConnectionFailed
        ConnectionError.new(error.message, details: error)
      when Faraday::ServerError
        status = error.response&.dig(:status)
        body = error.response&.dig(:body)
        ServerError.new(error.message, status_code: status, response: body, details: error)
      when Faraday::ClientError
        status = error.response&.dig(:status)
        body = error.response&.dig(:body)
        ClientError.new(error.message, status_code: status, response: body, details: error)
      else
        status = error.respond_to?(:response) ? error.response&.dig(:status) : nil
        body = error.respond_to?(:response) ? error.response&.dig(:body) : nil
        new(error.message, status_code: status, response: body, details: error)
      end
    end
  end

  # Client error (4xx)
  class ClientError < Error; end

  # Server error (5xx)
  class ServerError < Error; end

  # Timeout error
  class TimeoutError < Error; end

  # Connection error
  class ConnectionError < Error; end

  # Validation error
  class ValidationError < Error; end

  # Configuration error
  class ConfigurationError < Error; end
end
