require 'logger'
require 'savon'

require 'stellae/status_codes'

require 'stellae/request/catalog_information_request'
require 'stellae/request/import_line_list_request'
require 'stellae/request/new_order_entry_request'

require 'stellae/types/base'
require 'stellae/types/line_list_row'
require 'stellae/types/order'
require 'stellae/types/order_detail'

require 'stellae/xml'
require 'stellae/response'
require 'stellae/response_parser'

module Stellae
  # Operation contracts
  # https://webservice.stellae.us/SIIServices_multi/SIIService.svc?wsdl=wsdl0

  # Message transport definitions, including their insane shorthand entity names
  # https://webservice.stellae.us/SIIServices_multi/SIIService.svc?xsd=xsd0

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
      call_endpoint_with_request(
        :get_catalog_information, request
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
      call_endpoint_with_request(
        :import_line_list,
        request
      )
    end

    def new_order_entry(request)
      call_endpoint_with_request(
        :new_order_entry,
        request
      )
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

    def default_request_attributes
      {
        xmlns: 'SII'
      }
    end

    def xml_for_request(request)
      Stellae::Xml.for_user_and_request(
        username,
        password,
        request
      )
    end

    def call_endpoint_with_request(endpoint_name, request)
      response = client.call(
        endpoint_name,
        attributes: default_request_attributes,
        message: xml_for_request(request)
      )

      response_parser = Stellae::ResponseParser.new(response)

      Response.new(
        request: request,
        status: response_parser.status
      )

    end
  end
end
