FactoryGirl.define do
  factory :order, class: Stellae::Order do
    sequence(:order_id) { "TKTO-#{Time.new.to_i.to_s[-5..-1]}" }

    carrier 'FEDEX'
    service '02'

    currency 'USD'
    customer_address_1 '5 Crosby st.'
    customer_address_city 'New York'
    customer_address_state 'NY'
    customer_address_country 'US'
    customer_address_zip 10001

    customer_name 'Orlando Hall'

    delivery_address_1 '8728 Pitkin ave.'
    delivery_address_city 'Ozone Park'
    delivery_address_country 'US'
    delivery_address_state 'NY'
    delivery_address_zip 11417
    delivery_name 'DO NOT SHIP THIS IS A TEST'
    delivery_telephone '718 718 7187'

    email 'quinton@totokaelo.com'

    # order_details

    discount 0
    shipping_fees 0
    taxes 43.97
    total_amount 650.02
  end
end
