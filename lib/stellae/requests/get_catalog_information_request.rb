module Stellae
  module Requests
    class GetCatalogInformationRequest < Base
      endpoint_name :get_catalog_information

      string :upc
      string :style
      string :season_code
      string :flags
    end
  end
end
