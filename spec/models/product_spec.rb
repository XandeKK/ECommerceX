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
  end
end
