require 'rails_helper'

RSpec.describe "Products", type: :request do
  describe "GET /show" do
    it "returns http success" do
      product = create(:product)
      get product_path(product)
      expect(response).to have_http_status(:success)
      expect(response.body).to include(product.name)
      expect(response.body).to include(product.sku)
      expect(response.body).to include(product.price.to_s)
      expect(response.body).to include(product.desc)
    end

    it "should redirect" do
      get product_path("no_exist")
      expect(response).to have_http_status(:redirect)
    end
  end
end
