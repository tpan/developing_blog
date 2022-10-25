FactoryBot.define do
    factory :article do
        title { Faker::GreekPhilosophers.name }
        body { Faker::GreekPhilosophers.quote }
        slug { Faker::GreekPhilosophers.name}
        trait :no_body do
            body { nil }
        end
    end
end
