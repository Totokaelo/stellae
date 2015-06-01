require 'stellae/response/base_response'
require 'stellae/response/get_catalog_information_response'
require 'stellae/response/get_inventory_on_hand_response'
require 'stellae/response/get_shipment_information_response'

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
