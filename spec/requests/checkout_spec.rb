require 'rails_helper'

RSpec.describe "Checkouts", type: :request do
  describe "GET /success" do
    it "returns http success" do
      get "/checkout/success"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /cancel" do
    it "returns http success" do
      get "/checkout/cancel"
      expect(response).to have_http_status(:success)
    end
  end

end
