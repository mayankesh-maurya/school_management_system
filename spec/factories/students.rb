FactoryBot.define do
  factory :student do
    name { Faker::Name.name }
    email {Faker::Internet.email}
    password {"password"}
    school {association :school}
    course {association :course}
    batch {association :batch}

    trait :invalid do
      name { Faker::Name.name }
			email { nil }
			password {"password"}
    end
  end
end