FactoryGirl.define do
  factory :upc_inventory_request, class: Stellae::UpcInventoryRequest do
    warehouse 'NYC'
    sequence(:upc) { |n| "TKTESTUPC0000#{i}" }
  end
end
