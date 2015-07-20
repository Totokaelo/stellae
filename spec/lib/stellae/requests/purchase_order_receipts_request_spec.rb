require 'spec_helper'

describe Stellae::PurchaseOrderReceiptsRequest do
  subject {
    described_class.new(
      entry_date_from: (Date.today - 7),
      entry_date_from: Date.today,
      po_xact: 1394
    )
  }

  let(:response) { gateway.execute(subject) }

  it 'succeeds' do
    expect(response.success?).to be true
  end

  xit 'is the correct class' do
    expect(response.is_a?(Stellae::PurchaseOrderReceiptsResponse)).to be true
  end
end
