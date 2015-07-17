module Stellae
  class PurchaseOrderReceiptsRequest < Requests::Base
    endpoint_name :get_purchase_order_receipt
    root_name :ohn

    # 'receipt date start'
    #
    datetime :entry_date_from

    # 'receipt date end'
    #
    datetime :entry_date_to

    # 'normally invoice number'
    #
    string :po_ref1

    # 'normally purchase order number'
    #
    string :po_ref2

    # 'normally stellae purchase order transaction number'
    #
    integer :po_xact
  end
end
