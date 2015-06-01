require 'spec_helper'

describe Stellae::Response::GetInventoryOnHandResponse do
  subject { gateway.execute(request) }

  let(:request) { build(:get_inventory_on_hand_request) }

  it 'should return success' do
    expect(subject.success?).to be true
  end

  it 'should be a Stellae::Response::GetInventoryOnHandResponse' do
    expect(subject.is_a?(described_class)).to be true
  end

  context 'with single upc' do
    let(:upc_request_array) { [build(:upc_inventory_request, upc: in_stock_upcs.first)] }

    let(:request) { build(:get_inventory_on_hand_request, upcs: upc_request_array) }

    it 'should have inventory information' do
      expect(subject.inventory_values.length).to eq(1)

      inventory_value = subject.inventory_values.first

      expect(inventory_value.is_a?(Stellae::Types::UpcInventoryResponse)).to be true
    end
  end
end

