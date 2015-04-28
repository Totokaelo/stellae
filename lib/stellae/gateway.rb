require 'logger'
require 'savon'

require 'stellae/status_codes'

require 'stellae/request/base'

require 'stellae/xml'
require 'stellae/xml/user_builder'
require 'stellae/xml/line_list_row_builder'
require 'stellae/xml/line_list_rows_builder'

require 'stellae/request_xml_builder'

require 'stellae/response'
require 'stellae/response_parser'

module Stellae
  # Operation contracts
  # https://webservice.stellae.us/SIIServices_multi/SIIService.svc?wsdl=wsdl0

  # Message transport definitions, including their insane shorthand entity names
  # https://webservice.stellae.us/SIIServices_multi/SIIService.svc?xsd=xsd3

  # Moar complex types
  # https://webservice.stellae.us/SIIServices_multi/SIIService.svc?xsd=xsd2

  # These are pretty un-useful, but for completion's sake...
  # https://webservice.stellae.us/SIIServices_multi/SIIService.svc?xsd=xsd1
  # https://webservice.stellae.us/SIIServices_multi/SIIService.svc?xsd=xsd3

  class Gateway
    def initialize(
      endpoint_url:,
      username:,
      password:,
      logger: Logger.new(nil)
    )
      @endpoint_url = endpoint_url
      @username = username
      @password = password
      @logger = logger
    end

    def get_catalog_information(request)
      # SOAP DATA TYPE: Catalog_items_request
      # FLAGS, season_code, style, upc
      request_xml = user_xml + '<cir xmlns:a="http://schemas.datacontract.org/2004/07/" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"/>'

      response = client.call(
        :get_catalog_information,
        attributes: default_request_attributes,
        message: request_xml
      )

      response_parser = Stellae::ResponseParser.new(response)

      Response.new(
        request: request,
        status: response_parser.status
      )
    end

    def get_inventory_on_hand
      # This returns the current on hand inventory quantity
      # less any orders that have been received but not picked.
      # It currently does not return any products that have zero on hand inventory.
      # Please note that the array of inventory values has an unknown limit, but less than 100.
      raise NotImplementedError
    end

    def get_shipment_information
      # This supplies information about shipment and returns.
      # Please note, due to the heavy processing required by this request,
      # we limit to a maximum of 3 days if you don’t specify an order number.
      raise NotImplementedError
    end

    def import_line_list(request)
      # This allows the import of new items to the line list
      request_xml_builder = Stellae::RequestXmlBuilder.new(
        username: username,
        password: password,
        request: request
      )

      response = client.call(
        :import_line_list,
        attributes: default_request_attributes,
        message: request_xml_builder.xml
      )

      response_parser = Stellae::ResponseParser.new(response)

      Response.new(
        request: request,
        status: response_parser.status
      )
    end

    def new_order_entry
      # The purpose of this method is to create an order on the
      # Stellae system to allow the fulfillment of the order.
      raise NotImplementedError
    end

    def purchase_order_receipt
      # This is to find out what has been received.
      raise NotImplementedError
    end

    def new_asn_entry
      # "Advance ship notice"
      # This message provides the needed information to receive goods into inventory.
      # This should be sent instead of a purchase order.
      raise NotImplementedError
    end

    def new_purchase_order_entry
      # Per Donald, don't implement
      raise NotImplementedError
    end


    def new_delivery_ticket
      # Per Donald, don't implement
      raise NotImplementedError
    end

    def import_invoice
      # Per Donald, don't implement
      raise NotImplementedError
    end

    def client
      @client ||= Savon.client(
        wsdl: wsdl,

        # prevent Savon from prepending the 'wsdl' namespace
        namespace_identifier: nil,

        logger: @logger,
        pretty_print_xml: true,
        log_level: :debug,
        log: true
      ) do
        # prevent conversion to camelCase
        convert_request_keys_to :none
      end
    end

    private

    attr_reader :logger,
      :username,
      :password

    def wsdl
      "#{@endpoint_url}?wsdl"
    end

    def user_xml
      @user_xml ||= Stellae::Xml::UserBuilder.new(
        username: username,
        password: password
      ).xml
    end

    def default_request_attributes
      {
        xmlns: 'SII'
      }
    end
  end
end
