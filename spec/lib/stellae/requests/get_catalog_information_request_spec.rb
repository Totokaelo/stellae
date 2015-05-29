require 'spec_helper'

describe Stellae::Requests::GetCatalogInformationRequest do
  subject { described_class.new }

  it 'connects' do
    response = gateway.execute(subject)
    expect(response.success?).to be true
  end
end
