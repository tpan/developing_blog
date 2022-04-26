FactoryBot.define do
    factory :article do
        title { Faker::GreekPhilosophers.name }
        body { Faker::GreekPhilosophers.quote }
    end
end
