module Stellae
  class PurchaseOrderReceiptsResponse < Response::BaseResponse
    def items
      # Purchase_Order_Receipt_Items
      if success?
        @items ||= body_po_items.map do |hash|
          build_purchase_order_receipt_line_items(hash)
        end
      else
        []
      end
    end

    private

    def body_po_items
      build_array(
        dig_attribute_path(body, :purchase_order_receipt_items, :purchase_order_receipt_item)
      )
    end

    def build_purchase_order_receipt_line_items(hash)
      PurchaseOrderReceiptLineItem.new(hash)
    end
  end
end
