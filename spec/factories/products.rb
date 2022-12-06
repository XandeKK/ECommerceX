FactoryBot.define do
  factory :product do
    name { "Blusa de Ben 10" }
    sequence(:sku) { |n| "BLUSA-B10-#{n}" }
    desc { "Um Blusa de Ben 10 clássico" }
  end
end
