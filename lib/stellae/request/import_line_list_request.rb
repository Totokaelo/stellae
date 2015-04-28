module Stellae
  module Request
    class ImportLineListRequest
      def initialize(line_list_rows)
        @line_list_rows = line_list_rows
      end

      def root_tag_name
        'line_list_rows'
      end

      def write_xml(xml)
        return if line_list_rows.nil?

        line_list_rows.each do |line_list_row|
          xml.tag!(
            'a:Line_list_row'
          ) do |xml_line_list_row|
            xml_line_list_row.a :upc, line_list_row.upc
            xml_line_list_row.a :description, line_list_row.description
            xml_line_list_row.a :style, line_list_row.style
            xml_line_list_row.a :color_code, line_list_row.color_code
            xml_line_list_row.a :size_code, line_list_row.size_code

            return

            xml_line_list_row.season_code line_list_row.season_code
            xml_line_list_row.alternate_code line_list_row.alternate_code
            xml_line_list_row.color line_list_row.color

            xml_line_list_row.content line_list_row.content
            xml_line_list_row.country_of_origin line_list_row.country_of_origin
            xml_line_list_row.fabric_code line_list_row.fabric_code
            xml_line_list_row.htscode line_list_row.htscode
            xml_line_list_row.imageurl line_list_row.imageurl
            xml_line_list_row.nrf_size line_list_row.nrf_size

            xml_line_list_row.activity line_list_row.activity
            xml_line_list_row.activity_code line_list_row.activity_code

            xml_line_list_row.cost line_list_row.cost
            xml_line_list_row.currency_code line_list_row.currency_code
            xml_line_list_row.price_group line_list_row.price_group
            xml_line_list_row.retail_price line_list_row.retail_price
            xml_line_list_row.wholesale_price line_list_row.wholesale_price


            xml_line_list_row.size line_list_row.size
            xml_line_list_row.size_order line_list_row.size_order
          end
        end
      end

      private

      attr_reader :line_list_rows

      def namespaces
        {
          'xmlns:a' => 'http://schemas.datacontract.org/2004/07/',
          'xmlns:i' => 'http://www.w3.org/2001/XMLSchema-instance'
        }
      end
    end
  end
end
