require 'rails_helper'

RSpec.describe Category, type: :model do

  describe "Validates" do
    subject { build(:category) }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:desc) }
  end

  describe "Associations" do
    it { should have_many(:products_categories) }
  end

  describe "#products" do
    subject(:category) { create(:category) }

    before do
      create(:products_category, category: category, product: create(:product))
      create(:products_category, category: category, product: create(:product, name: "Blusa de naruto"))
    end

    it "returns products" do
      actual_products = category.products
      expect_products = Product.all

      expect(actual_products).to match_array(expect_products)
    end
  end
end
