FactoryBot.define do
  factory :order do
    billing_address { "Test_billing_address" }

    trait :incorrect_status do
      status { 3 }
    end

    trait :correct_status do
      status { 2 }
    end

    trait :correct_date do
      date { "2021-09-05 07:11:25" }
    end

    trait :correct_total do
      total { 10 }
    end

    association :user, factory: :non_admin_user

    factory :non_status_order, traits: [:correct_date, :correct_total]
    factory :non_date_order, traits: [:correct_status, :correct_total]
    factory :non_total_order, traits: [:correct_status, :correct_date]
    factory :correct_order, traits: [:correct_status, :correct_date, :correct_total]
  end
end