module Stellae
  module Requests
    # Requests act as transports for request data, and has some information about the request
    class Base < Stellae::Types::Base
      class << self
        # Sets the name of the webservice endpoint this Request corresponds to.
        #
        # == Parameters::
        # endpoint_name::
        #  A string that represents the endpoint the Request will hit.
        #
        def endpoint_name(endpoint_name)
          @@endpoint_name = endpoint_name
        end
      end

      # Gets the name of the webservice endpoint this Request corresponds to.
      #
      def endpoint_name
        @@endpoint_name
      end
    end
  end
end
