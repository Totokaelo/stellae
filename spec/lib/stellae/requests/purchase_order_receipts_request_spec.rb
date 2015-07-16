require 'spec_helper'

describe Stellae::PurchaseOrderReceiptsRequest do
  subject { described_class.new(po_xact: 1) }

  let(:response) { gateway.execute(subject) }

  it 'succeeds' do
    expect(response.success?).to be true
  end

  it 'is the correct class' do
    expect(response.is_a?(Stellae::PurchaseOrderReceiptsResponse)).to be true
  end
end
