# frozen_string_literal: true

module Astroapi
  module Validators
    # Base validator class for input validation
    class BaseValidator
      def self.validate!(value, context = nil)
        new(value, context).validate!
      end

      def initialize(value, context = nil)
        @value = value
        @context = context
        @errors = []
      end

      def validate!
        perform_validation
        raise ValidationError, error_message unless @errors.empty?
      end

      protected

      def perform_validation
        raise NotImplementedError, 'Subclasses must implement perform_validation'
      end

      def add_error(message)
        @errors << message
      end

      def error_message
        @errors.join('; ')
      end

      def validate_presence(hash, key, label = nil)
        label ||= key.to_s
        add_error("#{label} is required") if hash.nil? || !hash.key?(key) || hash[key].nil?
      end

      def validate_range(value, range, label)
        return if value.nil?

        return if range.cover?(value)

        add_error("#{label} must be between #{range.min} and #{range.max}, got #{value}")
      end

      def validate_type(value, type, label)
        return if value.nil?

        return if value.is_a?(type)

        add_error("#{label} must be a #{type}, got #{value.class}")
      end

      def validate_enum(value, allowed_values, label)
        return if value.nil?

        return if allowed_values.include?(value)

        add_error("#{label} must be one of #{allowed_values.join(', ')}, got #{value}")
      end

      def validate_string_non_empty(value, label)
        return if value.nil?

        add_error("#{label} must be a non-empty string") unless value.is_a?(String) && !value.strip.empty?
      end
    end
  end
end
