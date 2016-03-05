FactoryGirl.define do
  factory :state do
    name { FFaker::Name.name }
    abbreviation { FFaker::Company.bs }

    trait :invalid do
      name nil
      abbreviation nil
    end
  end
end
