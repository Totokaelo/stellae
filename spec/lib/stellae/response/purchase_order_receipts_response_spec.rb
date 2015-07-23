require 'spec_helper'

describe Stellae::PurchaseOrderReceiptsResponse do
  let(:poxact_number)   { 1373 }
  let(:porxact_number)  { 2022 }  # How do we know about this?
  let(:warehouse)       { 'NYC' }

  let(:request) {
    Stellae::PurchaseOrderReceiptsRequest.new(
      entry_date_from: (Date.today - 60),
      entry_date_to: Date.today,
      po_xact: poxact_number
    )
  }

  subject { gateway.execute(request) }

  it 'succeeds' do
    expect(subject.success?).to be true
  end

  it 'is the correct class' do
    expect(subject.is_a?(Stellae::PurchaseOrderReceiptsResponse)).to be true
  end

  describe '#items' do
    let(:items) { subject.items }

    it 'should have 4 items' do
      expect(items.length).to eq 4
    end

    describe 'first item' do
      let(:first_item) { items.first }
      let(:polinenum)    { 1 }     # This also works for every other line 8)
      let(:sku) { '266721' }

      let(:qty_received) { 3 }
      let(:qty_ordered) { 3 }

      it 'should be the right type' do
        expect(first_item.is_a?(Stellae::PurchaseOrderReceiptLineItem)).to be true
      end

      it 'should map poxact' do
        expect(first_item.poxact).to eq poxact_number
      end

      it 'should map porxact' do
        expect(first_item.porxact).to eq porxact_number
      end

      it 'should map polinenum' do
        expect(first_item.polinenum).to eq polinenum
      end

      it 'should map warehouse' do
        expect(first_item.warehouse).to eq warehouse
      end

      it 'should map qty_rcvd' do
        expect(first_item.qty_rcvd).to eq qty_received
      end

      # I have no idea what extended amount is.

      it 'should map sku' do
        expect(first_item.sku).to eq sku
      end

      it 'should map po_ordered' do
        expect(first_item.po_ordered).to eq qty_ordered
      end

      it 'should map vendor' do
        expect(first_item.vendor).to eq 'TOTO KAELO' # ...
      end
    end
  end
end
