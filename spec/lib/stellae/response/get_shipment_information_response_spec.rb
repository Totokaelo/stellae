require 'spec_helper'

describe Stellae::Response::GetShipmentInformationResponse do
  let(:response) { gateway.execute(request) }

  let(:shipped_order_id) { 'TKTO-74187' }
  let(:shipped_order_date) { DateTime.new(2015, 06, 03) }

  let(:request) {
    build(
      :get_shipment_information_request,

      order_id: shipped_order_id,
      date_from: shipped_order_date,
      date_to: shipped_order_date
    )
  }

  subject { response }

  it 'should return success' do
    expect(subject.success?).to be true
  end

  it 'should be a Stellae::Response::GetShipmentInformationResponse' do
    expect(subject.is_a?(described_class)).to be true
  end

  describe '#shipments' do
    let(:shipments) { response.shipments }
    let(:first_shipment_status) { shipments.first }
    let(:shipment_carton) { first_shipment_status.shipment_cartons.first }
    let(:carton_items) { shipment_carton.carton_items }
    let(:carton_item) { carton_items.first }

    subject { shipments }

    it 'should not be empty' do
      expect(subject.empty?).to be false
    end

    describe 'shipment status fields' do
      subject { first_shipment_status }

      it 'should populate order id' do
        expect(subject.order_id).to eq(shipped_order_id)
      end

      it 'should populate invoice number' do
        expect(subject.invoice_number).to eq(shipped_order_id)
      end

      it 'should populate invoice type' do
        expect(subject.invoice_type).to eq('IN')
      end

      it 'should populate invoice daet' do
        expect(subject.invoice_date).to eq(shipped_order_date)
      end
    end

    describe 'shipment carton' do
      subject { shipment_carton }

      it 'should not be nil' do
        expect(subject).to_not be nil
      end

      it 'should populate carrier' do
        expect(subject.carrier).to eq 'FEDEX'
      end

      it 'should populate service' do
        expect(subject.service).to eq '02'
      end

      it 'should populate tracking' do
        expect(subject.tracking).to_not be :empty?
      end

      it 'should populate carton items' do
        expect(subject.carton_items.any?).to be true

      end
    end

    describe 'carton item' do
      subject { carton_item }

      it 'shouldnt be nil' do
        expect(subject).to_not be nil
      end

      it 'should populate price' do
        expect(subject.price).to eq 10
      end

      it 'should populate SKU' do
        expect(subject.sku).to eq 'TKTEST000000414577'
      end

      it 'should populate quantity' do
        expect(subject.quantity).to eq 1
      end
    end
  end
end
