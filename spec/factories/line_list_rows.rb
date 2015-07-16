FactoryGirl.define do
  factory :line_list_row, class: Stellae::Types::LineListRow do
    sequence(:upc) { Time.new.to_i.to_s.rjust(16,'0')[0..16] }
    description 'A Cool Hat Description'
    style 'A Cool Hat Style'
    color_code '001'

    size 'One Size'
    size_order 1
    size_code 'S'

    activity 'Maison Martin Margiela'
    activity_code 123
    alternate_code nil
    color 'Black'
    content nil
    country_of_origin 'US'

    currency_code 'USD'
    cost 100
    retail_price 150
    wholesale_price 100

    fabric_code nil
    htscode nil
    imageurl 'http://totokaelo.com/'
    price_group 'ghi' # wtf is this
    season_code 'FW15'
  end
end
