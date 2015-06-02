module Stellae
  # Comes off the wire from GetShipmentInformation, as a child of ShipmentStatus
  #
  class ShipmentCarton < Types::Base
    # Carrier
    # "FEDEX" or "US POSTAL"
    #
    string :carrier

    # Shipment Service Id
    #
    string :service

    # Carrier Tracking Code
    #
    string :tracking

    # Return Tracking Code
    #
    string :return_tracking

    # UCC128
    #
    string :ucc128

    # Array of Order_Detail_New
    #
    collection :carton_items
  end
end
