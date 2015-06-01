module Stellae
  module Response
    class GetCatalogInformationResponse < BaseResponse
      # Return an array of CatalogItem
      #
      def catalog_items
        if success?
          body_catalog_items.map do |hash|
            Stellae::Types::CatalogItem.new(hash)
          end
        else
          []
        end
      end

      private

      def body_catalog_items
        build_array(
          dig_attribute_path(body, :catalog_items, :catalog_item)
        )
      end
    end
  end
end
