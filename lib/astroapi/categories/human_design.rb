# frozen_string_literal: true

require_relative 'base_category'
require_relative '../validators/subject_validator'

module Astroapi
  module Categories
    # Human Design category client
    class HumanDesign < BaseCategory
      # Calculate bodygraph
      # @param request [Hash] Subject birth data
      # @return [Hash] Full bodygraph data
      def calculate_bodygraph(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('bodygraph'), body: request)
      end

      # Get type only
      # @param request [Hash] Subject birth data
      # @return [Hash] Human Design type
      def get_type(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('type'), body: request)
      end

      # Calculate design date
      # @param request [Hash] Subject birth data
      # @return [Hash] Design (88 degrees) date
      def calculate_design_date(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('design-date'), body: request)
      end

      # Calculate compatibility
      # @param request [Hash] Two subjects' birth data
      # @return [Hash] Human Design compatibility
      def calculate_compatibility(request)
        http.post(build_url('compatibility'), body: request)
      end

      # Calculate transit overlay
      # @param request [Hash] Subject and transit date
      # @return [Hash] Transit overlay on bodygraph
      def calculate_transits(request)
        Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
        http.post(build_url('transits'), body: request)
      end

      # Get channels glossary
      # @param params [Hash] Query parameters
      # @return [Hash] Channels reference
      def get_channels_glossary(params = {})
        http.get(build_url('glossary', 'channels'), params: params)
      end

      # Get gates glossary
      # @param params [Hash] Query parameters
      # @return [Hash] Gates reference
      def get_gates_glossary(params = {})
        http.get(build_url('glossary', 'gates'), params: params)
      end

      # Get types glossary
      # @param params [Hash] Query parameters
      # @return [Hash] Types reference
      def get_types_glossary(params = {})
        http.get(build_url('glossary', 'types'), params: params)
      end

      protected

      def api_prefix
        '/api/v3/human-design'
      end
    end
  end
end
