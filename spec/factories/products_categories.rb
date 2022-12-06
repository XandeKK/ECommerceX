FactoryBot.define do
  factory :products_category do
    product { create(:product) }
    category { create(:category) }
  end
end
