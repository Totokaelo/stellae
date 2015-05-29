require 'logger'
require 'savon'

require 'stellae/status_codes'

require 'stellae/types/base'
require 'stellae/types/line_list_row'
require 'stellae/types/order'
require 'stellae/types/order_detail'
require 'stellae/types/upc_inventory_request'

require 'stellae/requests/base'
require 'stellae/requests/get_catalog_information_request'
require 'stellae/requests/get_inventory_on_hand_request'
require 'stellae/requests/import_line_list_request'
require 'stellae/requests/new_order_entry_request'

require 'stellae/xml'
require 'stellae/response'
require 'stellae/response_parser'

module Stellae
  # Encapsulates all the weirdness of a Stellae request
  #
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

    # Executes a Stellae request
    #
    # == Parameters::
    # request::
    #   A Stellae::Request
    #
    # == Returns::
    # response::
    #   A Stellae::Response
    #
    def execute(request)
      request_xml = Stellae::Xml.for_user_and_request(username, password, request)

      savon_response = client.call(
        request.endpoint_name,
        attributes: default_request_attributes,
        message: request_xml
      )

      savon_response
    end

    # This returns the current on hand inventory quantity
    # less any orders that have been received but not picked.
    # It currently does not return any products that have zero on hand inventory.
    # Please note that the array of inventory values has an unknown limit, but less than 100.
    def get_inventory_on_hand
      raise NotImplementedError
    end

    # This supplies information about shipment and returns.
    # Please note, due to the heavy processing required by this request,
    # we limit to a maximum of 3 days if you don’t specify an order number.
    def get_shipment_information(request)
      call_endpoint_with_request(
        :get_shipment_information,
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
  end
end
