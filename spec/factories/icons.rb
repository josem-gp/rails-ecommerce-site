FactoryBot.define do
  factory :icon do  
    trait :with_name do
      name { "default_icon" } #name is default_icon because that´s the icon that will be tagged to every created user at first
    end

    trait :in_IMAGES do
      url { Icon::IMAGES[0] }
    end

    trait :not_in_IMAGES do
      url { "https://image.shutterstock.com/image-photo/glass-cup-hot-aromatic-tea-600w-1146290894.jpg" }
    end

    factory :correct_url_icon, traits: [:with_name, :in_IMAGES]
    factory :incorrect_url_icon, traits: [:with_name, :not_in_IMAGES]
    factory :non_name_icon, traits: [:in_IMAGES]
  end
end