require 'spec_helper'

describe Stellae::Response::NewOrderEntryResponse, :focus do
  let(:order_detail) {
    build(
      :order_detail,
      sku: in_stock_upcs[0],
      price: 10,
      quantity: 1
    )
  }

  let(:order_details) { [order_detail] }
  let(:order) { build(:order, order_details: order_details) }
  let(:request) { build(:new_order_entry_request, order: order) }

  subject { gateway.execute(request) }

  it 'should return success' do
    expect(subject.success?).to be true
  end

  it 'should be a Stellae::Response::NewOrderEntryRequest' do
    expect(subject.is_a?(described_class)).to be true
  end

  it 'should populate sii_order_number' do
    expect(subject.sii_order_number).to_not be nil
  end
end
