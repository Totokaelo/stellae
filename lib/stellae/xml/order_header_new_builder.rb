module Stellae
  module Xml
    class OrderHeaderNewBuilder < FragmentBuilder
      def initialize(order:)
        super(order)
      end

      protected

      def tag_name(object_key)
        case object_key
        when :shipping_fees
          "#{namespace}:SHIPPPING_FEES"
        when :order_details
          "#{namespace}:Order_Details"
        else
          "#{namespace}:#{object_key.upcase}"
        end
      end

      def keys_sorted_for_serialization
        %i(
          carrier
          currency

          customer_address_1
          customer_address_2
          customer_address_3
          customer_address_city
          customer_address_country
          customer_address_state
          customer_address_zip

          customer_code
          customer_name
          customer_telephone

          delivery_address_1
          delivery_address_2
          delivery_address_3
          delivery_address_city
          delivery_address_country
          delivery_address_state
          delivery_address_zip

          delivery_from
          delivery_id
          delivery_message
          delivery_name
          delivery_telephone
          delivery_to

          discount
          email

          freight_account

          misc1
          misc1_reason
          misc2
          misc2_reason

          order_id
          order_type
          order_details

          service
          shipping_fees
          taxes
          total_amount
          user1
          user2
          user3
          user4
          user5
          warehouse
        )
      end
    end
  end
end
