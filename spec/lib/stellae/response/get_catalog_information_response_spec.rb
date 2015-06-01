require 'spec_helper'

describe Stellae::Response::GetCatalogInformationResponse do
  subject { gateway.execute(request) }

  let(:request) { build(:get_catalog_information_request) }

  it 'should return success' do
    expect(subject.success?).to be true
  end

  it 'should be a Stellae::Response::GetCatalogInformationResponse' do
    expect(subject.is_a?(described_class)).to be true
  end
end
