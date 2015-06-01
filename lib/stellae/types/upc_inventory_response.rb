module Stellae
  module Types
    class UpcInventoryResponse < Base
      # UPC
      #
      string :upc

      # Warehouse
      #
      string :warehouse

      # On Hand
      #
      decimal :on_hand

      # Lot
      #
      string :lot

      # Unit of Measurement
      #
      string :uom
    end
  end
end
