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
require 'stellae/requests/get_shipment_information'
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
  end
end
