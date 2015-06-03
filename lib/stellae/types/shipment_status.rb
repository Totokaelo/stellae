module Stellae
  # Comes off the wire from GetShipmentInformation
  #
  class ShipmentStatus < Types::Base
    # Array of ShipmentCartons
    #
    collection :shipment_cartons

    # Invoice Date
    #
    datetime :invoice_date

    # Invoice Number
    # Carrier-specific Order Id
    #
    string :invoice_number

    # Invoice Type
    # 'IN' -> Shipment
    # 'CM' -> Return
    #
    string :invoice_type

    # Order Id
    # Carrier-specific Order Id
    # Not sure how this differs from Invoice Number
    #
    string :order_id
  end
end

