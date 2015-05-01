module Stellae
  module Types
    class OrderDetail < Base
      string :cost
      string :flags
      string :line_id
      string :lot_number

      decimal :price
      decimal :quantity

      string :retail_price
      string :size
      string :sku
    end
  end
end
