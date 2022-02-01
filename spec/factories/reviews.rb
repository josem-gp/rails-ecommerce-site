FactoryBot.define do
  factory :review do
    association :user, factory: :non_admin_user
    association :product, factory: :correct_product

    trait :with_title do
      title { "Review_title_test" }
    end

    trait :with_correct_content do
      content { "Lorem ipsum dolor sit amet" }
    end

    trait :with_incorrect_content do
      content { "Lo" }
    end

    trait :with_correct_rating do
      username { 5 }
    end

    trait :with_incorrect_rating do
      username { 6 }
    end

    factory :non_title_review, traits: [:with_correct_content, :with_correct_rating]
    factory :non_content_review, traits: [:with_title, :with_correct_rating]
    factory :non_rating_review, traits: [:with_title, :with_correct_content]
    factory :incorrect_review_content, traits: [:with_title, :with_incorrect_content, :with_correct_rating]
    factory :incorrect_review_rating, traits: [:with_title, :with_correct_content, :with_incorrect_rating]
    factory :correct_review, traits: [:with_title, :with_correct_content, :with_correct_rating]
  end
end