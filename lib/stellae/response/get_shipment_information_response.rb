module Stellae
  module Response
    class GetShipmentInformationResponse < BaseResponse
      def shipments
        if success?
        else
          []
        end
      end
    end
  end
end
