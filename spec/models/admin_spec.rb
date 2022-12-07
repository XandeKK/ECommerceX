require 'rails_helper'

RSpec.describe Admin, type: :model do
  describe "Validates" do
    subject { build(:admin) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }

    it { should_not allow_value("opa").for(:email) }
    it { should_not allow_value("a@a@a@a@a@").for(:email) }
    it { should allow_value("Quemerda@gmail.com").for(:email) }
  end
end
