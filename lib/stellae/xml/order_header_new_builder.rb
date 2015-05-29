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
        else
          "#{namespace}:#{object_key.upcase}"
        end
      end
    end
  end
end
