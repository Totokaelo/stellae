module Stellae
  module Types
    class Order < Base
      root_name :ohn

      # Shipping Carrier
      # 'Preferred carrier'
      # ex: either FEDEX or UPS
      #
      string :carrier

      # Shipping Service
      # 'Carrier service code' ... 'The service code is passed to the carrier'
      # Numeric service id
      # ex: '01' (FEDEX PRIORITY OVERNIGHT)
      #
      string :service

      # Currency
      # 'If currency is not filled in, it will be based on
      # system parameters internal to the Stellae system.'
      # For now, I think leave this alone and it'll default to USD
      #
      string :currency

      string :customer_address_1
      string :customer_address_2
      string :customer_address_3
      string :customer_address_city

      # Customer Billing Address Country
      # ISO2
      #
      string :customer_address_country
      string :customer_address_state
      string :customer_address_zip

      # Customer Name
      # 'Bill to customer name'
      #
      string :customer_name

      # Customer Code
      # 'Bill to customer code – if blank, will assign'
      #
      string :customer_code
      string :customer_po
      string :customer_telephone

      string :delivery_address_1
      string :delivery_address_2
      string :delivery_address_3
      string :delivery_address_city
      # Customer Shipping Address Country
      # ISO2
      #
      string :delivery_address_country
      string :delivery_address_state
      string :delivery_address_zip

      string :delivery_dc_edi
      string :delivery_door_edi
      string :delivery_from
      string :delivery_id
      string :delivery_message
      string :delivery_name
      string :delivery_telephone
      string :delivery_to

      # Discount
      # 'total discount $'
      #
      decimal :discount

      # Email
      # 'used to send to fedex/ups'
      #
      string :email

      # Freight Account
      # "On bill to receipt, recipient’s account"
      #
      string :freight_account

      decimal :misc1
      string :misc1_reason

      decimal :misc2
      string :misc2_reason

      # Order Id
      # 'Order number (sending system order number).  Stellae will store this
      # information and have use a different order number internally'
      # Our native Order Id
      #
      string :order_id

      # Must be "OO" or "CM"
      # OO: New Order
      # CM: Order Return
      string :order_type

      decimal :shipping_fees
      decimal :taxes
      decimal :total_amount

      # User1
      # URLencoded Url pointing to an invoice PDF
      #
      string :user1
      string :user2
      string :user3
      string :user4
      string :user5
      string :warehouse

      collection :order_details

      def initialize(init_hash = {})
        super(init_hash)

        @order_type = 'OO'
      end
    end
  end
end
