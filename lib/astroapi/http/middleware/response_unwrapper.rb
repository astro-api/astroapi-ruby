# frozen_string_literal: true

module Astroapi
  module HTTP
    module Middleware
      # Faraday middleware to unwrap API response envelopes
      # The API returns responses wrapped in { data: {...} } or { result: {...} }
      # This middleware extracts the inner payload transparently
      class ResponseUnwrapper < Faraday::Middleware
        def on_complete(env)
          env[:body] = unwrap(env[:body]) if env[:body].is_a?(Hash)
        end

        private

        def unwrap(body)
          return body unless body.is_a?(Hash)

          # Try to extract 'data' first, then 'result', otherwise return body as-is
          body.fetch('data') { body.fetch('result', body) }
        end
      end
    end
  end
end
