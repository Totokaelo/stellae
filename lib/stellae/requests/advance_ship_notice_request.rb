module Stellae
  # Register a new Product Order via this service
  #
  # "Advance ship notice"
  # This message provides the needed information to receive goods into inventory.
  # This should be sent instead of a purchase order.
  #
  class AdvanceShipNoticeRequest < Requests::Base
    endpoint_name :new_asn_entry
    root_name :ahn

    # Line Items for the incoming Product Order
    #
    collection :asn_lines

    # Invoice Date
    #
    datetime :invoice_date

    # 'normally invoice number'
    #
    string :poref1

    # 'normally purchase order number'
    #
    string :poref2

    # Not mentioned in the documentation.
    #
    string :poref3

    # Not mentioned in the documentation
    #
    string :season

    # Ship Date
    #
    datetime :ship_date

    # None of these are mentioned in the documentation!!! Yay
    #
    string :vendoraddress1
    string :vendoraddress2
    string :vendoraddress3
    string :vendorcity
    string :vendorcode
    string :vendorcountry
    string :vendorname
    string :vendorstate
    string :vendorzip
    string :warehouse
  end
end
