module Stellae
  class PurchaseOrderReceiptLineItem < Types::Base
    # stellae purchase order transaction number
    #
    integer :poxact

    # stellae purchase receipt transaction number
    #
    integer :porxact

    #  stellae purchase order line number
    #
    integer :polinenum

    # transaction date
    #
    datetime :po_entry_date

    # entered receipt date
    #
    datetime :po_receipt_date

    #
    #
    string :warehouse

    #
    #
    decimal :qty_rcvd

    # extended amount
    # TODO: What the hell is this?
    #
    decimal :extended_amount

    #
    #
    string :sku

    # 'asn quantity' ie amt initially ordered
    #
    decimal :po_ordered

    # vendor name
    #
    string :vendor

    # normally invoice num from AdvanceShipNotice
    #
    string :poref1

    # normally purchase order number from from AdvanceShipNotice
    #
    string :poref2

    # 'comment'
    #
    string :pocomment

    #
    #
    string :style

    #
    #
    string :color_code

    #
    #
    string :size_code

    #
    #
    string :lot_number

    protected

    # 'ext_amount' coming across the wire – this is a helper for initializer.
    #
    alias_method :ext_amount=, :extended_amount=
  end
end
