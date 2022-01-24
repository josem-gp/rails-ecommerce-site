FactoryBot.define do
  factory :user do
    password { "1234567" }
    name { "Jose Test" }
    shipping_address { "jose_shipping_test" }
    phone_number { "08012341234" }
    association :icon

    trait :with_username do
      username { "jose_test" }
    end

    trait :with_email do
      sequence(:email) { |n| "jose_test#{n}@test.io" }
    end

    trait :admin do
      admin { true }
    end

    trait :not_admin do
      admin { false }
    end

    factory :non_email_user, traits: [:with_username, :not_admin]
    factory :non_username_user, traits: [:with_email, :not_admin]
    factory :admin_user, traits: [:with_username, :with_email,:admin]
    factory :non_admin_user, traits: [:with_username, :with_email, :not_admin]
  end
end


# User needs to have username
# User needs to have unique username (case sensitive - false)
# User needs to have username with minimun length of 3
# User needs to have email
# User needs to have unique email
# User gets icon before validation
# User is added to newsletter after creation
# User gets a confirmation email after creation