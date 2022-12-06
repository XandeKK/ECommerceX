require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "Validates" do
    subject { build(:product) }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:sku) }
    it { should validate_presence_of(:desc) }

    it { should validate_length_of(:name).is_at_most(100) }
    it { should validate_length_of(:sku).is_at_most(30) }
    it { should validate_length_of(:desc).is_at_most(500)  }

    it { should validate_uniqueness_of(:sku) }
  end

  describe "Associations" do
    it { should have_many(:products_categories) }
    it { should have_one(:discount) }
  end

  describe "#has_discount?" do
    it "should have discount" do
      product = create(:product)
      discount = create(:discount, active: true, product: product)

      expect(product.has_discount?).to equal(true)
    end

    it "should not have discount" do
      product = create(:product)
      discount = create(:discount, active: false, product: product)

      expect(product.has_discount?).to equal(false)
    end
  end
end
