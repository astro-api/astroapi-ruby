# frozen_string_literal: true

require_relative 'base_category'
require_relative '../validators/subject_validator'

module Astroapi
  module Categories
    # Zi Wei Dou Shu (Purple Star) category client
    class Ziwei < BaseCategory
      # Calculate Zi Wei chart
      # @param request [Hash] Subject birth data
      # @return [Hash] Zi Wei Dou Shu chart
      def calculate_chart(request)
        Validators::SubjectValidator.validate!(request)
        http.post(build_url('chart'), body: request)
      end

      protected

      def api_prefix
        '/api/v3/ziwei'
      end
    end
  end
end
