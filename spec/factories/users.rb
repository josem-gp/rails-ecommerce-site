FactoryBot.define do
  factory :user do
    username { "jose_test" }
    sequence(:email) { |n| "jose_test#{n}@test.io" }
    password { "1234567" }
    name { "Jose Test" }
    shipping_address { "jose_shipping_test" }
    phone_number { "08012341234" }
    association :icon

    trait :admin do
      admin { true }
    end

    trait :not_admin do
      admin { false }
    end

    factory :admin_user, traits: [:admin]
    factory :non_admin_user, traits: [:not_admin]
  end
end

# User needs to have unique email
# User needs to have unique username (case sensitive - false) and length minimun 3
# User gets icon before validation
# User is added to newsletter after creation
# User gets a confirmation email after creation