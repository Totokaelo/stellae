module Stellae
  module Response
    class GetShipmentInformationResponse < BaseResponse
      def shipments
        if success?
          body_shipment_statuses.map do |hash|
            build_shipment_status(hash)
          end
        else
          []
        end
      end

      private

      def body_shipment_statuses
        build_array(
          dig_attribute_path(body, :shipments, :shipment_status)
        )
      end

      def build_shipment_status(hash)
        shipment_carton_hashes = build_array(
          dig_attribute_path(hash, :cartons, :shipment_cartons)
        )

        shipment_cartons = shipment_carton_hashes.map { |h| build_shipment_carton(h) }

        param_hash = hash.reject { |k| k == :cartons }
        param_hash[:shipment_cartons] = shipment_cartons

        ShipmentStatus.new(param_hash)
      end

      def build_shipment_carton(hash)
        order_detail_hashes = build_array(
          dig_attribute_path(hash, :carton_items, :order_detail_new)
        )

        order_details = order_detail_hashes.map { |h| OrderDetail.new(h) }

        param_hash = hash.merge :carton_items => order_details

        ShipmentCarton.new(param_hash)
      end
    end
  end
end
