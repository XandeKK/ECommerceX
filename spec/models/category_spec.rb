require 'rails_helper'

RSpec.describe Category, type: :model do

  describe "Validates" do
    subject { build(:category) }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:desc) }
  end

  describe "Associations" do
    it { should have_many(:product_categories) }
  end

  describe "#products" do
    it "returns products" do
      category = create(:category)
      p category.class
      products = category.products
      expect(products).to match_array(Product.find_by(category: category))
    end
  end
end
