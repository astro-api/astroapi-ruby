# frozen_string_literal: true

module Astroapi
  module HTTP
    module Middleware
      # Faraday middleware to add Bearer token authentication
      class Authentication < Faraday::Middleware
        def initialize(app, config)
          super(app)
          @config = config
        end

        def call(env)
          if @config.api_key && !env.request_headers['Authorization']
            env.request_headers['Authorization'] = "Bearer #{@config.api_key}"
          end
          @app.call(env)
        end
      end
    end
  end
end
