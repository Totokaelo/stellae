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
    #
    decimal :price

    # Quantity
    #
    decimal :quantity

    # Retail Price
    #
    string :retail_price

    # Size
    #
    string :size
  end
end
