FactoryBot.define do
  factory :admin do
    sequence(:email) { |n| "Fulano#{n}@gmail.com" } 
    password { "password" }
  end
end
