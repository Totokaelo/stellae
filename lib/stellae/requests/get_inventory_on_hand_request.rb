module Stellae
  module Requests
    # This returns the current on hand inventory quantity
    # less any orders that have been received but not picked.
    # It currently does not return any products that have zero on hand inventory.
    # Please note that the array of inventory values has an unknown limit, but less than 100.
    #
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
