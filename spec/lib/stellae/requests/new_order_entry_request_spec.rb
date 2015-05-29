require 'spec_helper'

describe Stellae::Requests::NewOrderEntryRequest do
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
      shipping_fees: 0,
      taxes: 43.97,
      total_amount: 650.02
    )
  }

  subject { described_class.new(order: order) }

  it 'succeeds' do
    response = gateway.execute(subject)
    expect(response.success?).to be true
  end
end
