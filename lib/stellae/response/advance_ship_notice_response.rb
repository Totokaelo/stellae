require 'stellae/types/advance_ship_notice_line_item'

module Stellae
  class AdvanceShipNoticeResponse < Response::BaseResponse
    def stellae_order_number
      body[:sii_order_number]
    end
  end
end
