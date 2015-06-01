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
end

