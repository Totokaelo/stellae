FactoryGirl.define do
  factory :upc_inventory_request, class: Stellae::Types::UpcInventoryRequest do
    warehouse 'NYC'
    sequence(:upc) { |n| "STELLAEUPC#{n}" }
  end
end
