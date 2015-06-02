module Stellae
  module Response
    class NewOrderEntryResponse < BaseResponse
      # Stellae's internal Order Number
      #
     def sii_order_number
       body[:sii_order_number].to_s
     end
    end
  end
end
