module Stellae
  module Types
    # Result from GetCatalogInformationRequest
    #
    class CatalogItem < Base
      string :upc

      string :color

      string :color_code

      string :description

      string :fabric

      string :season_code

      string :size_code

      string :style
    end
  end
end
