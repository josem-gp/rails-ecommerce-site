FactoryBot.define do
  factory :user do
    password { "1234567" }
    name { "Jose Test" }
    shipping_address { "jose_shipping_test" }
    phone_number { "08012341234" }
    association :icon, factory: :correct_url_icon

    trait :with_username do
      sequence(:username) { |n| "jose_test#{n}" }
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