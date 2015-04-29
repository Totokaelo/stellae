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
      :retail_price,
      :season_code,
      :size,
      :size_order,
      :wholesale_price
    end
  end
end
