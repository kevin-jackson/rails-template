FactoryGirl.define do
  factory :address do
    line_1 { FFaker::AddressAU.street_address }
    line_2 { FFaker::AddressAU.secondary_address }
    city { FFaker::AddressAU.city }
    suburb { FFaker::AddressAU.suburb }
    postal_code { FFaker::Company.bs }
    association :state

    trait :invalid do
      line_1 nil
      line_2 nil
      city nil
      suburb nil
      postal_code nil
      state nil
    end
  end
end
