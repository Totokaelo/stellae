module Stellae
  module Requests
    class NewOrderEntryRequest < Base
      endpoint_name :new_order_entry

      entity :order
    end
  end
end
