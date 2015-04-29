module Stellae
  module Xml
    # Builds a <cir>
    class CatalogInformationRequestBuilder < FragmentBuilder
      def initialize(
        flags: nil,
        season_code: nil,
        style: nil,
        upc: nil
      )
        @flags = flags
        @season_code = season_code
        @style = style
        @upc = upc
      end

      def xml
        xml_markup = Builder::XmlMarkup.new

        xml_markup.tag!(
          'cir',
          namespaces
        ) do |x|
          write_tag x, :flags, @flags
          write_tag x, :season_code, @season_code
          write_tag x, :style, @style
          write_tag x, :upc, @upc
        end

        xml_markup.target!
      end
    end
  end
end
