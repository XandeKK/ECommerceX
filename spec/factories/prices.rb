FactoryBot.define do
  factory :price do
    product { nil }
    stripe_price_id { "MyString" }
  end
end
