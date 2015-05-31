module Stellae
  module Types
    # LineListRow corresponds to actual sellable goods - Product / Item / etc
    #
    class LineListRow < Base
      # UPC
      # Unique id
      #
      string :upc

      # Description
      # Not sure
      #
      string :description

      # Style
      # Not sure
      #
      string :style

      # Color Code
      # NRF color code
      #
      string :color_code

      # Size
      # Not sure
      #
      string :size

      # Size Order
      # Not sure
      #
      integer :size_order

      # Size Code
      # Not sure
      #
      string :size_code

      # NRF Size
      #
      string :nrf_size

      # Activity
      # Not sure
      #
      string :activity

      # Activity Code
      # Not sure
      #
      string :activity_code

      # Alternate Code
      # Not sure
      #
      string :alternate_code

      # Color
      # color name
      #
      string :color

      # Content
      # not sure
      #
      string :content

      # Currency code
      #
      string :currency_code

      # Price Group
      # Not sure. Both examples used 'LIST'
      #
      string :price_group

      # Cost
      # Not sure
      #
      decimal :cost

      # Retail Price
      #
      decimal :retail_price

      # Wholesale Price
      #
      decimal :wholesale_price

      # Country of Origin
      # Full country name
      #
      string :country_of_origin

      # Fabric Code
      #
      string :fabric_code

      # HTS Code
      # "Harmonized Tariff Code"
      # http://www.customsinfo.com/Industry-Blog/bid/123187/What-is-an-HTS-Code
      #
      string :htscode

      # Image URL
      # Product Image Url
      #
      string :imageurl

      # Season Code
      #
      string :season_code
    end
  end
end
