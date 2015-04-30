module Stellae
  module Types
    class LineListRow
    # Required
      attr_accessor :upc,
        :description,
        :style,
        :color_code,
        :size_code

      # Optional
      attr_accessor :activity,
        :activity_code,
        :alternate_code,
        :color,
        :content,
        :cost,
        :country_of_origin,
        :currency_code,
        :fabric_code,
        :htscode,
        :imageurl,
        :nrf_size,
        :price_group,
        :season_code,
        :size,
        :size_order

      attr_writer :cost,
        :retail_price,
        :wholesale_price

      def cost
        @cost || 0.0
      end

      def retail_price
        @retail_price || 0.0
      end

      def wholesale_price
        @wholesale_price || 0.0
      end
    end
  end
end
