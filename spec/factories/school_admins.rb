FactoryBot.define do
  factory :school_admin do
    name { Faker::Name.name }
    email {Faker::Internet.email}
    password {"password"}
    school {association :school}

    trait :invalid do
      name { Faker::Name.name }
    	email { nil }
    	password {"password"}
    end
  end
end