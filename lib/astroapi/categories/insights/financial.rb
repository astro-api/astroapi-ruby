# frozen_string_literal: true

require_relative '../base_category'
require_relative '../../validators/subject_validator'

module Astroapi
  module Categories
    module Insights
      # Financial insights sub-client
      class Financial < BaseCategory
        # Get market timing
        # @param request [Hash] Date range and market
        # @return [Hash] Market timing analysis
        def get_market_timing(request)
          http.post(build_url('market-timing'), body: request)
        end

        # Analyze personal trading
        # @param request [Hash] Subject birth data
        # @return [Hash] Personal trading style analysis
        def analyze_personal_trading(request)
          Validators::SubjectValidator.validate!(request[:subject] || request['subject'])
          http.post(build_url('personal-trading'), body: request)
        end

        # Get Gann analysis
        # @param request [Hash] Market and date
        # @return [Hash] W.D. Gann analysis
        def get_gann_analysis(request)
          http.post(build_url('gann-analysis'), body: request)
        end

        # Get Bradley Siderograph
        # @param request [Hash] Date range
        # @return [Hash] Bradley Siderograph data
        def get_bradley_siderograph(request)
          http.post(build_url('bradley-siderograph'), body: request)
        end

        # Get crypto timing
        # @param request [Hash] Cryptocurrency and date range
        # @return [Hash] Crypto timing analysis
        def get_crypto_timing(request)
          http.post(build_url('crypto-timing'), body: request)
        end

        # Get forex timing
        # @param request [Hash] Currency pair and date range
        # @return [Hash] Forex timing analysis
        def get_forex_timing(request)
          http.post(build_url('forex-timing'), body: request)
        end

        protected

        def api_prefix
          '/api/v3/insights/financial'
        end
      end
    end
  end
end
