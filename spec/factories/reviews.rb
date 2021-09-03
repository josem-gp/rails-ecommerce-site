FactoryBot.define do
  factory :review do
    content { "MyText" }
    rating { 1 }
    user { nil }
    product { nil }
  end
end
