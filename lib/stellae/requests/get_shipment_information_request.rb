module Stellae
  module Requests
    # Per Documentation: 'This supplies information about shipment and returns.
    # Please note, due to the heavy processing required by this request,
    # we limit to a maximum of 3 days if you don’t specify an order number.'
    #
    # Per Don: 'there is one "funny" in that we don't allow over 14 day range if you don't
    # supply an order number.  if you do a larger range, we take the ending date and
    # subtract 14 days to get the starting date.'
    #
    class GetShipmentInformationRequest < Base
      endpoint_name :get_shipment_information

      root_name :ohn

      datetime :date_from
      datetime :date_to
      string :order_id
    end
  end
end
