FactoryBot.define do
  factory :batch do
    name { Faker::Name.name }
    description { Faker::Lorem.paragraphs.join("\n\n") }
    school {association :school}
    course {association :course}

    trait :invalid do
      name { nil }
      description { "invalid_description" }
    end
  end
end