FactoryBot.define do
  factory :school do
    name { Faker::Name.name }
    description { Faker::Lorem.paragraphs.join("\n\n") }

    trait :invalid do
      name { nil }
      description { "invalid_description" }
    end
  end
end