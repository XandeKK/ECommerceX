require 'rails_helper'

RSpec.describe Discount, type: :model do
  describe "Validates" do
    subject { build(:discount) }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:desc) }
    it { should validate_presence_of(:discount_percent) }

    it { should validate_length_of(:name).is_at_most(50) }
    it { should validate_length_of(:desc).is_at_most(300) }

    it do
     should validate_numericality_of(:discount_percent).is_less_than_or_equal_to(75).
      is_greater_than_or_equal_to(5)
    end
  end

  describe "Associations" do
    it { should belong_to(:product) }
  end
end
