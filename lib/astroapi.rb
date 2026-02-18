# frozen_string_literal: true

require_relative 'astroapi/version'
require_relative 'astroapi/error'
require_relative 'astroapi/configuration'
require_relative 'astroapi/client'

# Main module for the Astrology API Ruby client
module Astroapi
  class << self
    # Create a new client instance
    # @param options [Hash] Configuration options
    # @return [Client] New client instance
    def new(options = {}, &block)
      Client.new(options, &block)
    end
  end
end
