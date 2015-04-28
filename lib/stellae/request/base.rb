module Stellae
  module Request
    # Transport for arbitrary request.
    # Knows how to write itself
    class Base
      # The completely arbitrary transport name for the request parameters.
      # eg: catalog_items_request -> 'cir'
      def root_tag_name
        raise NotImplementedError
      end

      # Given an XmlBuilder
      def write_xml(xml)
        nil
      end
    end
  end
end

require 'stellae/request/catalog_information_request'
require 'stellae/request/import_line_list_request'
require 'stellae/request/line_list_row'
