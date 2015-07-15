module Totokaelo
  #
  #
  class AdvanceShipNoticeLineItem < Types::Base
    root_name :Asn_Line

    # 'carton number'
    #
    string :cartonno

    # 'carton ref'
    #
    string :cartonref

    # 'color'
    #
    string :color_code

    # 'comment'
    #
    string :comment

    # 'composition'
    #
    string :composition

    # 'unit cost'
    #
    decimal :cost

    # 'Country of Origin'
    #
    string :country_origin

    # 'customer code'
    #
    string :customer_code

    # 'description'
    #
    string :description

    # Not documented
    #
    string :lot_number

    # 'quantity expected'
    #
    decimal :quantity

    # 'sales order number'
    #
    string :sales_order

    # 'season'
    #
    string :season

    # 'size'
    #
    string :size_code

    # 'upc/sku'
    #
    string :sku

    # 'store/door code'
    #
    string :store_code

    # 'style'
    #
    string :style
  end
end
