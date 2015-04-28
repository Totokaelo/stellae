module Stellae
  module Xml
    # Builds a <line_list_rows>
    class LineListRowsBuilder
      def initialize(line_list_row_xml)
        @line_list_row_xml = line_list_row_xml
      end

      def xml
        xml_markup = Builder::XmlMarkup.new

        xml_markup.tag!(
          'line_list_rows',
          namespaces
        ) do |x|
          x << @line_list_row_xml
        end

        xml_markup.target!
      end

      private

      def namespaces
        Stellae::Xml::NAMESPACES
      end
    end
  end
end
