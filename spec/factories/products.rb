FactoryBot.define do
  factory :product do
    name { "Product_test" }
    description { "Lorem ipsum dolor sit amet" }
    price { 1000 }
    association :user, factory: :non_admin_user

    trait :correct_availability do
      rating { 1 }
    end

    trait :incorrect_availability do
      rating { 3 }
    end

    factory :correct_product, traits: [:correct_availability]
    factory :incorrect_product, traits: [:incorrect_availability]
  end
end


# Product name needs to be unique (case sensitive)
# Product availability needs to be a number between 1 and 2
# When product is created, initial sales should be 0