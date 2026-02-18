# frozen_string_literal: true

require_relative 'configuration'
require_relative 'http/client'
require_relative 'categories/data'
require_relative 'categories/charts'
require_relative 'categories/horoscope'
require_relative 'categories/analysis'
require_relative 'categories/glossary'
require_relative 'categories/astrocartography'
require_relative 'categories/chinese'
require_relative 'categories/eclipses'
require_relative 'categories/lunar'
require_relative 'categories/numerology'
require_relative 'categories/tarot'
require_relative 'categories/traditional'
require_relative 'categories/fixed_stars'
require_relative 'categories/insights'
require_relative 'categories/svg'
require_relative 'categories/enhanced'
require_relative 'categories/vedic'
require_relative 'categories/human_design'
require_relative 'categories/kabbalah'
require_relative 'categories/horary'
require_relative 'categories/fengshui'
require_relative 'categories/palmistry'
require_relative 'categories/pdf'
require_relative 'categories/render'
require_relative 'categories/ziwei'

module Astroapi
  # Main client for the Astrology API
  #
  # @example Initialize with API key
  #   client = Astroapi::Client.new(api_key: 'your-api-key')
  #
  # @example Initialize with configuration block
  #   client = Astroapi::Client.new do |config|
  #     config.api_key = 'your-api-key'
  #     config.timeout = 15
  #     config.debug = true
  #   end
  #
  # @example Use environment variables
  #   ENV['ASTROLOGY_API_KEY'] = 'your-api-key'
  #   client = Astroapi::Client.new
  class Client
    attr_reader :data, :charts, :horoscope, :analysis, :glossary,
                :astrocartography, :chinese, :eclipses, :lunar, :numerology,
                :tarot, :traditional, :fixed_stars, :insights, :svg, :enhanced,
                :vedic, :human_design, :kabbalah, :horary, :fengshui,
                :palmistry, :pdf, :render, :ziwei,
                :config

    # Initialize a new client
    # @param options [Hash] Configuration options
    # @option options [String] :api_key API key for authentication
    # @option options [String] :base_url Base URL for the API
    # @option options [Integer] :timeout Request timeout in seconds
    # @option options [Boolean] :debug Enable debug logging
    # @yield [config] Configuration block
    # @yieldparam config [Configuration] Configuration object
    def initialize(options = {})
      @config = Configuration.new

      if block_given?
        yield @config
      else
        options.each do |key, value|
          @config.public_send(:"#{key}=", value) if @config.respond_to?(:"#{key}=")
        end
      end

      @http_client = HTTP::Client.new(@config)

      @data = Categories::Data.new(@http_client)
      @charts = Categories::Charts.new(@http_client)
      @horoscope = Categories::Horoscope.new(@http_client)
      @analysis = Categories::Analysis.new(@http_client)
      @glossary = Categories::Glossary.new(@http_client)
      @astrocartography = Categories::Astrocartography.new(@http_client)
      @chinese = Categories::Chinese.new(@http_client)
      @eclipses = Categories::Eclipses.new(@http_client)
      @lunar = Categories::Lunar.new(@http_client)
      @numerology = Categories::Numerology.new(@http_client)
      @tarot = Categories::Tarot.new(@http_client)
      @traditional = Categories::Traditional.new(@http_client)
      @fixed_stars = Categories::FixedStars.new(@http_client)
      @insights = Categories::InsightsCategory.new(@http_client)
      @svg = Categories::Svg.new(@http_client)
      @enhanced = Categories::Enhanced.new(@http_client)
      @vedic = Categories::Vedic.new(@http_client)
      @human_design = Categories::HumanDesign.new(@http_client)
      @kabbalah = Categories::Kabbalah.new(@http_client)
      @horary = Categories::Horary.new(@http_client)
      @fengshui = Categories::Fengshui.new(@http_client)
      @palmistry = Categories::Palmistry.new(@http_client)
      @pdf = Categories::Pdf.new(@http_client)
      @render = Categories::Render.new(@http_client)
      @ziwei = Categories::Ziwei.new(@http_client)
    end
  end
end
