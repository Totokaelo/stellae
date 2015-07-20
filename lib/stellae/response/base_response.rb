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
        # Status messages are coming back '0009 missing color code on line 1'
        #
        body[:status]
      end

      def success?
        status == 1
      end

      private

      # Dig into a strongly-expected nested path, but return nil if it doesn't exist
      #
      def dig_attribute_path(source, *attrs)
        result = source

        attrs.each do |attr|
          result = result[attr]

          break if result.nil?
        end

        result
      end

      # build_array
      # Array(Hash) doesn't work like we want it, so manually build the Array.
      #
      def build_array(element)
        if element.is_a?(Array)
          element
        else
          # Single-entity responses return a Hash
          [element]
        end.compact
      end

      # All responses come over in the following Savon-translated hash:
      #   {
      #     :get_catalog_information_response => {
      #       :get_catalog_information_result => { :status => 0001, :etc => {} }
      #     }
      #   }
      #

      # result - return the result hash
      #
      def result
        response.body.values.first
      end

      # body - return the body hash
      #
      def body
        result.values.first
      end
    end
  end
end
