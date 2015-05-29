require 'stellae/xml/fragment_builder'

module Stellae
  module Xml
    class GetInventoryRequestBuilder < FragmentBuilder
      def initialize(object)
        super(object)
      end

      def xml
        xml_builder = Builder::XmlMarkup.new

        xml_builder.tag!('upcs', namespaces) do |x|
          @object.upcs.each do |upc_inventory_request|
            upc_fragment_builder = Stellae::Xml::FragmentBuilder.new(
              upc_inventory_request,
              write_namespace_on_root: false
            )
            x << upc_fragment_builder.xml
          end
        end
      end
    end
  end
end
