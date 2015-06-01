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

  context 'with single upc' do
    let(:request) { build(:get_catalog_information_request, upc: in_stock_upcs.first) }

    it 'should return success' do
      expect(subject.success?).to be true
    end

    it 'should have catalog information' do
      expect(subject.catalog_items.length).to eq(1)

      catalog_item = subject.catalog_items.first

      expect(catalog_item.is_a?(Stellae::Types::CatalogItem)).to be true
    end
  end
end
