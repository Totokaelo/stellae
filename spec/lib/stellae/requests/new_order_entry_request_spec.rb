require 'spec_helper'

describe Stellae::Requests::NewOrderEntryRequest do
  let(:order_detail) {
    build(
      :order_detail,
      sku: in_stock_upcs[0],
      price: 10,
      quantity: 1
    )
  }

  let(:order) { build(:order, order_details: order_details) }

  subject { described_class.new(order: order) }

  context 'empty order' do
    let(:order_details) { [] }

    xit 'fails' do
      response = gateway.execute(subject)
      expect(response.success?).to be false
      expect(response.status).to eq 8
    end
  end

  context 'order with full order detail' do
    let(:order) {
      build(
        :order,
        order_details: order_details,
        discount: 0,
        taxes: 0,
        shipping_fees: 0,
        total_amount: 10
      )
    }

    let(:order_details) { [order_detail] }

    it 'succeeds' do
      response = gateway.execute(subject)
      expect(response.success?).to be true
    end
  end
end
