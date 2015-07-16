require 'stellae/response/base_response'
require 'stellae/response/get_catalog_information_response'
require 'stellae/response/get_inventory_on_hand_response'
require 'stellae/response/get_shipment_information_response'
require 'stellae/response/new_order_entry_response'
require 'stellae/response/advance_ship_notice_response'
require 'stellae/response/purchase_order_receipts_response'

module Stellae
  module Response
    def self.for(request, response)
      # Savon does some snake-casing under the hood, so this will be
      # snake-cased regardless of what Stellae's endpoint returns
      response_name = response.body.keys.first

      klass = case response_name
        when :get_catalog_information_response
          Stellae::Response::GetCatalogInformationResponse

        when :get_inventory_on_hand_response
          Stellae::Response::GetInventoryOnHandResponse

        when :get_shipment_information_response
          Stellae::Response::GetShipmentInformationResponse

        when :new_order_entry_response
          Stellae::Response::NewOrderEntryResponse

        when :new_asn_entry_response
          Stellae::AdvanceShipNoticeResponse

        when :new_asn_entry_response
          Stellae::AdvanceShipNoticeResponse

        when :get_purchase_order_receipt_response
          Stellae::PurchaseOrderReceiptsResponse

        else
          Stellae::Response::BaseResponse
        end

      klass.new(
        request: request,
        response: response
      )
    end
  end
end
