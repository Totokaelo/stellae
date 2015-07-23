require 'spec_helper'

describe Stellae::PurchaseOrderReceiptsRequest do
  subject {
    described_class.new(
      entry_date_from: (Date.today - 60),
      entry_date_to: Date.today,
      po_xact: 1373
    )
  }

  let(:response) { gateway.execute(subject) }

  xit 'is the correct class' do
    expect(response.is_a?(Stellae::PurchaseOrderReceiptsResponse)).to be true
  end
end
