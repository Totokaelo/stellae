module Stellae
  module Requests
    class GetShipmentInformation < Base
      endpoint_name :get_shipment_information

      root_name :ohn

      datetime :date_from
      datetime :date_to
      string :order_id

    end
  end
end
