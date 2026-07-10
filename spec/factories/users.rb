FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "password123" }
    password_confirmation { "password123" }
    role { :user }
  end

  factory :admin, class: User do
    email { Faker::Internet.email }
    password { "password123" }
    password_confirmation { "password123" }
    role { :admin }
  end
end