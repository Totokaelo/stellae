require 'logger'
require 'savon'

require 'stellae/status_codes'

require 'stellae/types/base'
require 'stellae/types/catalog_item'
require 'stellae/types/line_list_row'
require 'stellae/types/order'
require 'stellae/types/order_detail'
require 'stellae/types/upc_inventory_request'
require 'stellae/types/shipment_carton'
require 'stellae/types/shipment_status'

require 'stellae/xml'
require 'stellae/request'
require 'stellae/response'

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
      # Build the request XML
      request_xml = Stellae::Xml.for_user_and_request(
        username,
        password,
        request
      )

      # Call the sucker
      savon_response = client.call(
        request.endpoint_name,
        attributes: default_request_attributes,
        message: request_xml
      )

      # Build + return the response
      Stellae::Response.for(
        request,
        savon_response
      )
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
