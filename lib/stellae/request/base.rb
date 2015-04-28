module Stellae
  module Request
    # transport for webservice request information
    class Base
      # The completely arbitrary transport name for the request parameters.
      # eg: catalog_items_request -> 'cir'
      def root_tag_name
        raise NotImplementedError
      end
    end
  end
end

require 'stellae/request/catalog_information_request'

