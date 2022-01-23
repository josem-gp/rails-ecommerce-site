FactoryBot.define do
  factory :icon do
    sequence(:name) { |n| "icon_test#{n}" }

    trait :in_IMAGES do
      url { Icon::IMAGES[0] }
    end

    trait :not_in_IMAGES do
      url { "https://image.shutterstock.com/image-photo/glass-cup-hot-aromatic-tea-600w-1146290894.jpg" }
    end

    factory :correct_icon, traits: [:in_IMAGES]
    factory :incorrect_icon, traits: [:not_in_IMAGES]
  end
end


# Icon needs to have unique url
# Icon url needs to be part of IMAGES
# Icon needs to have unique name