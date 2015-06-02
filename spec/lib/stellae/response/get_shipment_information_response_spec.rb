require 'spec_helper'

describe Stellae::Response::GetShipmentInformationResponse, :focus do
  subject { gateway.execute(request) }
  # TKTO-75466
  # TKTO-76014


  let(:request) {
    build(
      :get_shipment_information_request,
      #order_id: '11099',
      #order_id: 'TKTO-75466',
      date_from: DateTime.parse('2015.06.01'),
      date_to: DateTime.parse('2015.06.03')
    )
  }

  it 'should return success' do
    expect(subject.success?).to be true
  end

  it 'should be a Stellae::Response::GetShipmentInformationResponse' do
    expect(subject.is_a?(described_class)).to be true
  end

end
