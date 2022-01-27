FactoryBot.define do
    factory :newsletter do  
        trait :with_url do
            email { "email@test.io" }
        end

        factory :non_email_newsletter
        factory :correct_newsletter, traits: [:with_url]
    end
end