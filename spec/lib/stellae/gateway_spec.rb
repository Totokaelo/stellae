require 'spec_helper'

describe Stellae::Gateway do
  let(:username) { 'TOTOKAELO' }
  let(:password) { 'fP4#WNZtu5Gf' }

  subject {
    described_class.new(
      endpoint_url: 'https://webservice.stellae.us/SIIServices_multi/Siiservice.svc',
      username: username,
      password: password,
      logger: Logger.new(STDOUT)
    )
  }

  let(:get_catalog_information_request) {
    Stellae::Request::CatalogInformationRequest.new
  }

  it 'connects' do
    response = subject.get_catalog_information(
      get_catalog_information_request
    )

    expect(response.success?).to be true
  end

  describe '#import_line_list' do
    let(:hat_line_list_row) {
      llr = Stellae::Types::LineListRow.new
      llr.upc = 'tktest0001'
      llr.description = 'cool hat'
      llr.style = 'black ballcap'
      llr.color_code = '001'
      llr.size_code = '0'
      llr.activity = 'Maison Martin Margiela'
      llr.activity_code = 123
      llr.alternate_code = nil
      llr.color = 'Black'
      llr.content = nil
      llr.country_of_origin = 'US'

      llr.currency_code = 'USD'
      llr.cost = 100
      llr.retail_price = 150
      llr.wholesale_price = 100

      llr.fabric_code = nil
      llr.htscode = nil
      llr.imageurl = 'http://totokaelo.com/'
      llr.price_group = 'ghi' # wtf is this
      llr.season_code = '33'

      llr.size = 'One Size'
      llr.size_code = 'OS'
      llr.size_order = 1

      llr
    }

    let(:import_line_list_request) {
      Stellae::Request::ImportLineListRequest.new(
        line_list_rows: [
          hat_line_list_row
        ]
      )
    }

    it 'returns success' do
      response = subject.import_line_list(
        import_line_list_request
      )

      expect(response.success?).to be true
    end
  end

  describe '#new_order_entry', :focus do
    let(:order_detail) {
      Stellae::Types::OrderDetail.new
    }

    let(:order) {
      Stellae::Types::Order.new
    }

    let(:order_entry_request) {
      Stellae::Request::NewOrderEntryRequest.new(order: order)
    }

    it 'returns success' do
      response = subject.new_order_entry(order_entry_request)

      expect(response.success?).to be true
    end
  end
end
