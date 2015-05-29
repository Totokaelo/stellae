module Stellae
  module Types
    # Used in conjunction with GetInventoryOnHandRequest
    #
    class UpcInventoryRequest < Base
      root_name :UPC_Inventory_Request

      string :warehouse
      string :upc
    end
  end
end
