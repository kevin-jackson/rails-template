FactoryGirl.define do
  
  factory :address do
    line_1 { FFaker::AddressAU.street_address }
    line_2 { FFaker::AddressAU.secondary_address }
    suburb { FFaker::AddressAU.suburb }
    city { FFaker::AddressAU.city }
    state { FFaker::AddressAU.state }
    post_code { FFaker::AddressAU.postcode }
  end
  
end
