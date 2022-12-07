require 'rails_helper'

RSpec.describe "Searches", type: :request do
  describe "POST /index" do
    it "returns http success" do
      create(:product)
      post search_path, params: { q: "Blusa" }
      expect(response).to have_http_status(:success)
      expect(response.body).to include("Blusa de Ben 10")
    end

    it "should includes blusa de ben 10" do
      create(:product)
      post search_path, params: { q: "Blusa" }
      expect(response.body).to include("Blusa de Ben 10")
    end

    it "should not includes blusa de ben 10" do
      post search_path, params: { q: "Blusa" }
      expect(response.body).not_to include("Blusa de Ben 10")
    end

    it "should includes with different query" do
      create(:product)
      post search_path, params: { q: "10" }
      expect(response.body).to include("Blusa de Ben 10")
    end

    it "should not includes with incorrect query" do
      create(:product)
      post search_path, params: { q: "Naruto" }
      expect(response.body).not_to include("Naruto")
    end
  end
end
