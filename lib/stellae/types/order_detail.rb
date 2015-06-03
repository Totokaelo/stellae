module Stellae
  class OrderDetail < Types::Base
    root_name :Order_Detail_New

    # SKU
    # UPC
    #
    string :sku

    # Cost
    # not used in the sample requests, not mentioned in the documentation
    #
    string :cost

    # Flags
    # 'flags concerning item'
    #
    string :flags

    # LineId
    # not used in the sample requests, not mentioned in the documentation
    #
    string :line_id

    # Lot Number
    # not used in the sample requests, not mentioned in the documentation
    #
    string :lot_number

    # Price
    # the price the unit sold at
    #
    decimal :price

    # Quantity
    # Quantity to ship
    #
    integer :quantity

    # Retail Price
    #
    string :retail_price

    # Size
    #
    string :size

    # Season
    # comes over the wire, Not sure what this is used for
    #
    string :season
  end
end
