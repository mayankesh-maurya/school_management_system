FactoryBot.define do
  factory :course do
    name { Faker::Name.name }
    description { Faker::Lorem.paragraphs.join("\n\n") }
    school {association :school}

    trait :invalid do
      name { nil }
      description { "invalid_description" }
    end
  end
end