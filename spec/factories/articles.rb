FactoryBot.define do
    factory :article do
        title { Faker::GreekPhilosophers.name }
        body { Faker::GreekPhilosophers.quote }

        trait :no_body do
            body { nil }
        end
    end
end
