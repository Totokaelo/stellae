require 'spec_helper'

describe Stellae::Gateway do
  let(:username) { 'TOTOKAELO' }
  let(:password) { 'fP4#WNZtu5Gf' }

  subject {
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

  describe '#new_order_entry' do
    let(:order_detail) {
      Stellae::Types::OrderDetail.new
    }

    let(:order) {
      Stellae::Types::Order.new(
        carrier: 'FEDEX',
        currency: 'USD',
        customer_address_1: '5 Crosby st.',
        customer_address_city: 'New York',
        customer_address_state: 'NY',
        customer_address_country: 'US',
        customer_address_zip: 10001,

        customer_name: 'Orlando Hall',

        delivery_address_1: '8728 Pitkin ave.',
        delivery_address_city: 'Ozone Park',
        delivery_address_country: 'US',
        delivery_address_state: 'NY',
        delivery_address_zip: 11417,
        delivery_name: 'DO NOT SHIP THIS IS A TEST',
        delivery_telephone: '718 718 7187',

        discount: 0,
        email: 'alex@onerockwell.com',

        order_id: '1000002test',

        # order_details

        service: 02,
        shippping_fees: 0,
        taxes: 43.97,
        total_amount: 650.02
      )
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
