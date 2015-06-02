module Stellae
  # Comes off the wire from GetShipmentInformation
  #
  class ShipmentStatus < Types::Base
    # Array of ShipmentCartons
    #
    collection :cartons

    # Invoice Date
    #
    date :invoice_date

    # Invoice Number
    # Carrier-specific Order Id
    #
    string :invoice_number

    # Invoice Type
    # 'IN' -> Shipment
    # 'CM' -> Return
    #
    string :invoice_type

    # Invoice Id
    # ???
    #
    string :invoice_id
  end
end

