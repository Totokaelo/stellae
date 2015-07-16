module Stellae
  #
  #
  class AdvanceShipNoticeLineItem < Types::Base
    root_name :Asn_Line

    # 'upc/sku'
    # Required.
    #
    string :sku

    # 'carton number'
    #
    #string :cartonno

    # 'carton ref'
    #
    #string :cartonref

    # 'color'
    # Most likely NRF color code.
    #
   # string :color_code

    # 'comment'
    #
   # string :comment

    # 'composition'
    #
 #   string :composition

    # 'unit cost'
    #
 #   decimal :cost
#u
    # 'Country of Origin'
    #
#    string :country_origin

    # 'customer code'
    #
#    string :customer_code

    # 'description'
    #
#    string :description

    # Not documented
    #
#    string :lot_number

    # 'quantity expected'
    #
#    decimal :quantity

    # 'sales order number'
    #
#    string :sales_order

    # 'season'
    #
#    string :season

    # 'size'
    #
#    string :size_code

    # 'store/door code'
    #
#    string :store_code

    # 'style'
    #
#    string :style
  end
end
