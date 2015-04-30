module Stellae
  module Xml
    # Builds a <Line_list_row>
    class LineListRowBuilder < FragmentBuilder
      def initialize(line_list_row)
        @line_list_row = line_list_row
      end

      def xml
        xml_markup = Builder::XmlMarkup.new

        xml_markup.tag!("#{namespace}:Line_list_row") do |x|
          attributes = [
            :activity,
            :activity_code,
            :alternate_code,
            :color,
            :color_code,
            :content,
            :cost,
            :country_of_origin,
            :currency_code,
            :description,
            :fabric_code,
            :htscode,
            :imageurl,
            :nrf_size,
            :price_group,
            :retail_price,
            :season_code,
            :size,
            :size_code,
            :size_order,
            :style,
            :upc,
            :wholesale_price
          ]

          # their XML reader will ignore elements if they come in non-alphabetical order.
          # alphabetize to get around this.
          alphabetized_attributes = attributes.sort

          alphabetized_attributes.each do |tag_name|
            write_tag(
              x,
              tag_name,
              @line_list_row.send(tag_name)
            )
          end
        end

        xml_markup.target!
      end
    end
  end
end
