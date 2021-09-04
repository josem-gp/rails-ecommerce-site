FactoryBot.define do
  factory :order do
    subtotal { 1 }
    total { 1 }
    date { "2021-09-05 07:11:25" }
    user { nil }
  end
end
