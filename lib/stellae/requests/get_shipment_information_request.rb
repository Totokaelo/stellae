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

      # Starting date
      # Time values will be ignored
      #
      datetime :date_from

      # Ending date for request window
      # Time values will be ignored
      # Cannot be larger than 14 days from date_from
      #
      datetime :date_to

      # Internal Order Id of the order you want to know about.
      # Note the order processing timestamp must fall inside date_from->date_to.
      #
      string :order_id
    end
  end
end
