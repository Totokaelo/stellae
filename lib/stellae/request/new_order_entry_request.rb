module Stellae
  module Request
    class NewOrderEntryRequest
      attr_reader :order

      def initialize(order:)
        @order = order
      end
    end
  end
end
