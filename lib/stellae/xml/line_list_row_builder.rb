module Stellae
  module Xml
    # Builds a <Line_list_row>
    class LineListRowBuilder
      def initialize(line_list_row)
        @line_list_row = line_list_row
      end

      def xml
        xml_markup = Builder::XmlMarkup.new

        xml_markup.tag!("#{namespace}:Line_list_row") do |x|
          [
            :upc,
            :description,
            :style,
            :color_code,
            :size_code,
            :activity,
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
          ].each do |tag_name|
            write_tag(x, tag_name, @line_list_row.send(tag_name))
          end
        end

        xml_markup.target!
      end

      private

      def write_tag(x, tag_name, value)
        if value.nil?
          x.tag! "#{namespace}:#{tag_name}", 'i:nil' => true
        else
          x.tag! "#{namespace}:#{tag_name}", value
        end
      end

      def namespace
        Stellae::Xml::TAG_NAMESPACE
      end
    end
  end
end
