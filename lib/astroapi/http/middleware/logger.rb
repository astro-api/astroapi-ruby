# frozen_string_literal: true

module Astroapi
  module HTTP
    module Middleware
      # Faraday middleware for debug logging
      class Logger < Faraday::Middleware
        def initialize(app, config)
          super(app)
          @config = config
        end

        def call(env)
          log_request(env) if @config.debug

          @app.call(env).on_complete do |response_env|
            log_response(response_env) if @config.debug
          end
        end

        private

        def log_request(env)
          @config.logger.debug("[Astroapi] Request: #{env.method.upcase} #{env.url}")
          @config.logger.debug("[Astroapi] Request Headers: #{sanitize_headers(env.request_headers)}")
          @config.logger.debug("[Astroapi] Request Body: #{env.body}") if env.body
        end

        def log_response(env)
          @config.logger.debug("[Astroapi] Response: #{env.status}")
          @config.logger.debug("[Astroapi] Response Headers: #{env.response_headers}")
          @config.logger.debug("[Astroapi] Response Body: #{env.body}")
        end

        def sanitize_headers(headers)
          sanitized = headers.dup
          sanitized['Authorization'] = '[REDACTED]' if sanitized['Authorization']
          sanitized
        end
      end
    end
  end
end
