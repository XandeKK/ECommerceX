require 'rails_helper'

RSpec.describe ProductsCategory, type: :model do
  describe "Associations" do
    it { should belong_to(:product) }
    it { should belong_to(:category) }
  end
end
