require 'spec_helper'

describe Stellae::Requests::GetInventoryOnHandRequest do
  subject { described_class.new }

  describe '#endpoint_name' do
    it 'should eq get_inventory_on_hand' do
      expect(subject.endpoint_name).to eq :get_inventory_on_hand
    end
  end

  it 'succeeds' do
    response = gateway.execute(subject)
    expect(response.success?).to be true
  end

  context 'with a couple UPC entries' do
    let(:upc_request_1) {
      build(:upc_inventory_request, upc: in_stock_upcs.first)
    }

    let(:upc_request_2) {
      build(:upc_inventory_request, upc: in_stock_upcs[1])
    }

    let(:upc_array) { [upc_request_1, upc_request_2] }

    subject { described_class.new(upcs: upc_array) }

    it 'succeeds' do
      response = gateway.execute(subject)
      expect(response.success?).to be true

    end
  end
end
