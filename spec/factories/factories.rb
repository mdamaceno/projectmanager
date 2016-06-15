FactoryGirl.define do
  skip_create

  factory :user do
    name Faker::Name.name
    username Faker::Internet.user_name
    email Faker::Internet.email
    password Faker::Internet.password(8)
  end

  factory :role do
    name Faker::Lorem.word
  end
end
