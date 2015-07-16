FactoryGirl.define do
  factory :advance_ship_notice_line_item, class: Stellae::AdvanceShipNoticeLineItem do
    sequence(:sku) { Time.new.to_i.to_s.rjust(16,'0')[0..16] }
  end
end
