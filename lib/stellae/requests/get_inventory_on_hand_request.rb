module Stellae
  module Requests
    class GetInventoryOnHandRequest < Base
      def initialize(args = {})
        super(args)

        @upcs ||= []
      end

      endpoint_name :get_inventory_on_hand

      collection :upcs
    end
  end
end
