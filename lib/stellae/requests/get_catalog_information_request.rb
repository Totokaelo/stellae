module Stellae
  module Requests
    class GetCatalogInformationRequest < Base
      endpoint_name :get_catalog_information

      string :upc
      string :style
      string :season_code
      string :flags

      def catalog_information_request?
        true
      end
    end
  end
end
