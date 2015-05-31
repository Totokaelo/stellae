require 'stellae/xml/fragment_builder'
require 'stellae/xml/get_inventory_request_builder'
require 'stellae/xml/user_builder'
require 'stellae/xml/line_list_rows_builder'
require 'stellae/xml/order_header_new_builder'

module Stellae
  module Xml
    TAG_NAMESPACE = 'a'
    INSTANCE_NAMESPACE = 'i'

    NAMESPACES = {
      "xmlns:#{TAG_NAMESPACE}" => 'http://schemas.datacontract.org/2004/07/',
      "xmlns:#{INSTANCE_NAMESPACE}" => 'http://www.w3.org/2001/XMLSchema-instance'
    }

    SII_XMLNS_DEFINITION = {
      xmlns: 'SII'
    }

    def self.for_user_and_request(username, password, request)
      [
        user_xml(username, password),
        request_xml(request)
      ].join('')
    end

    private

    def self.user_xml(username, password)
      user_xml = Stellae::Xml::UserBuilder.new(
        username: username,
        password: password
      ).xml
    end

    def self.request_xml(request)
      builder = case request
      when Stellae::Requests::ImportLineListRequest
        line_list_rows_xml = request.line_list_rows.map do |line_list_row|
          Stellae::Xml::FragmentBuilder.new(
            line_list_row,
            write_namespace_attributes_on_root: false
          ).xml
        end.join('')

        Stellae::Xml::LineListRowsBuilder.new(line_list_rows_xml)
      when Stellae::Requests::NewOrderEntryRequest
        Stellae::Xml::OrderHeaderNewBuilder.new(order: request.order)
      when Stellae::Requests::GetInventoryOnHandRequest
        Stellae::Xml::GetInventoryRequestBuilder.new(request)
      else
        Stellae::Xml::FragmentBuilder.new(request)
      end

      builder.xml
    end
  end
end
