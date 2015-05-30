module Stellae
  module Requests
    # This supplies information about shipment and returns.
    # Please note, due to the heavy processing required by this request,
    # we limit to a maximum of 3 days if you don’t specify an order number.
    class GetShipmentInformation < Base
      endpoint_name :get_shipment_information

      root_name :ohn

      datetime :date_from
      datetime :date_to
      string :order_id

    end
  end
end
