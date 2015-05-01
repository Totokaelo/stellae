module Stellae
  module Types
    class Order < Base
      root_name :ohn

      string :carrier
      string :currency

      string :customer_address_1
      string :customer_address_2
      string :customer_address_3
      string :customer_address_city
      string :customer_address_country
      string :customer_address_state
      string :customer_address_zip
      string :customer_code
      string :customer_po
      string :customer_telephone

      string :delivery_address_1
      string :delivery_address_2
      string :delivery_address_3
      string :delivery_address_city
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

      decimal :discount

      string :email

      string :freight_account

      decimal :misc1
      string :misc1_reason

      decimal :misc2
      string :misc2_reason

      string :order_id
      string :order_type

      string :service

      decimal :shippping_details
      decimal :taxes
      decimal :total_amount

      string :user1
      string :user2
      string :user3
      string :user4
      string :user5
      string :warehouse
    end
  end
end
