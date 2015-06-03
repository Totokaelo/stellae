require 'spec_helper'

describe Stellae::Response::GetShipmentInformationResponse, :focus do
  subject { gateway.execute(request) }
  # TKTO-75466
  # TKTO-76014


  let(:request) {
    build(
      :get_shipment_information_request,

      # order_id: 'TKTO-75466',
      # order_id: 'TKTO-76014',


      # Shipped Order Information: '11097'
      # order_id: 'TKTO-74187',
      date_from: '2015-05-30T17:00:00',
      date_to: '2015-05-30T17:00:00',
    )
  }

  it 'should return success' do
    expect(subject.success?).to be true
  end

  it 'should be a Stellae::Response::GetShipmentInformationResponse' do
    expect(subject.is_a?(described_class)).to be true
  end

end
