FactoryBot.define do
  factory :product do
    sequence(:name) { |n| "product_test#{n}" }
    description { "Lorem ipsum dolor sit amet" }
    price { rand(2000...10000) }
    association :user, factory: :non_admin_user
    rating { rand(1..5) }

    trait :correct_availability do
      availability { 1 }
    end

    trait :incorrect_availability do
      availability { 3 }
    end

    #Adds a test image for product after being created

    after(:create) do |product|
      product.photos.attach(
        io: File.open(Rails.root.join('test', 'fixtures', 'files', 'test.jpg')),
        filename: 'test.jpg',
        content_type: 'image/jpg'
      )
    end

    factory :correct_product, traits: [:correct_availability]
    factory :incorrect_product, traits: [:incorrect_availability]
  end
end