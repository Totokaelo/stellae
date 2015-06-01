require 'stellae/types/upc_inventory_response'

module Stellae
  module Response
    class GetInventoryOnHandResponse < BaseResponse
      # Return an array of UpcInventoryResponse
      #
      def inventory_values
        if success?
          body_inventory_values.map do |hash|
            Stellae::Types::UpcInventoryResponse.new(hash)
          end
        else
          []
        end
      end

      private

      def body_inventory_values
        build_array(
          dig_attribute_path(body, :inventory_values, :upc_inventory_response)
        )
      end
    end
  end
end
