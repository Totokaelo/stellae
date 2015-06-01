module Stellae
  module Response
    # Base class for responses.
    #
    class BaseResponse
      # request: original Stellae::Request
      #
      attr_reader :request

      # response: the Savon::Response
      #
      attr_reader :response

      def initialize(request:, response:)
        @request = request
        @response = response
      end

      def status
        body[:status].to_i
      end

      def status_message
        Stellae::StatusCodes[status]
      end

      def success?
        status == 1
      end

      private

      # All responses come over in the following Savon-translated hash:
      #   {
      #     :get_catalog_information_response => {
      #       :get_catalog_information_result => { :status => 0001 }
      #     }
      #   }
      #

      # result - return the result hash
      def result
        response.body.values.first
      end

      def body
        result.values.first
      end

      def response_name
        response.body.keys.first
      end
    end
  end
end
