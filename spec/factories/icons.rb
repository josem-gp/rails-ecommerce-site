FactoryBot.define do
  factory :icon do
    name { "default_icon" } #name is default_icon because that´s the icon that will be tagged to every created user at first

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