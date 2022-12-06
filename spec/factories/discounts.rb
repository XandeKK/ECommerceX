FactoryBot.define do
  factory :discount do
    name { "Natal" }
    desc { "Desconto de natal" }
    discount_percent { 10 }
    active { false }
    product { create(:product) }
  end
end
