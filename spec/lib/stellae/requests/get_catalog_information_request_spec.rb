require 'spec_helper'

describe Stellae::Requests::GetCatalogInformationRequest do
  subject { described_class.new }


  describe '#root_name' do
    it 'should be cir' do
      expect(subject.root_name).to eq(:cir)
    end
  end

  it 'succeeds' do
    response = gateway.execute(subject)
    expect(response.success?).to be true
  end
end
