require 'spec_helper'

describe Stellae::Requests::GetShipmentInformationRequest do
  subject { described_class.new }

  describe '#endpoint_name' do
    it 'should eq get_shipment_information' do
      expect(subject.endpoint_name).to eq :get_shipment_information


    end
  end

  it 'succeeds' do
    response = gateway.execute(subject)
    expect(response.success?).to be true
  end
end
