# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    title { Faker::GreekPhilosophers.unique.name }
    body { Faker::GreekPhilosophers.unique.quote }
    slug { Faker::GreekPhilosophers.unique.name }
    trait :no_body do
      body { nil }
    end
  end
end
