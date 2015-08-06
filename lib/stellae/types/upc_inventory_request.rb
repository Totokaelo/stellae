module Stellae
  # Used in conjunction with GetInventoryOnHandRequest
  #
  class UpcInventoryRequest < Types::Base
    root_name :UPC_Inventory_Request

    string :warehouse
    string :upc
  end
end
