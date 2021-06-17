# Hypofriend::DataService::Offer
module Hypofriend
  module DataService
    class Offer
      attr_reader :params

      def initialize(loan_amount:, property_value:, repayment:, years_fixed:)
        @params = {
          loan_amount: loan_amount,
          property_value: property_value,
          repayment: repayment,
          years_fixed: years_fixed
        }
      end

      def find_all
        return {} if params.blank?
        
        response = Hypofriend::Communicator.new(
          params: params,
          path: path
        ).call

        raise response.inspect unless response.success?

        JSON.parse(response.body).dig('data', 'offers')
      end

      private

      def path
        '/api/v5/new-offers'
      end
    end
  end
end
