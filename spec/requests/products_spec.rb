require 'rails_helper'

RSpec.describe "Products", type: :request do
  let(:product) { create(:product) }
  let(:admin) { create(:admin) }

  describe "GET /show" do
    it "returns http success" do
      get product_path(product)
      expect(response).to have_http_status(:success)
      expect(response.body).to include(product.name)
      expect(response.body).to include(product.sku)
      expect(response.body).to include(product.price.to_s)
      expect(response.body).to include(product.desc)
    end

    it "returns http not_found" do
      sign_in admin
      
      get product_path("no_exist")
      expect(response).to have_http_status(:not_found)
    end
  end

  describe "GET /new" do
    it "returns http sucess" do
      sign_in admin

      get new_product_path
      expect(response).to have_http_status(:success)
    end

    it "returns http found" do
      get new_product_path

      expect(response).to have_http_status(:found)
      expect(response).to redirect_to(admin_session_path)
    end
  end

  describe "POST product" do
    it "should create product" do
      sign_in admin


      post products_path, params: {
        product: {
          name: "Ben 10",
          sku: "Ben-10",
          price: 10,
          desc: "ben 10"
        }
      }

      expect(response).to have_http_status(:redirect)
    end

    it "should not create without correct value" do
      sign_in admin


      post products_path, params: {
        product: {
          name: nil,
          sku: nil,
          price: nil,
          desc: nil
        }
      }

      expect(response).to have_http_status(:unprocessable_entity)
    end

    it "returns http found" do
      post products_path, params: {
        product: {
          name: "Ben 10",
          sku: "Ben-10",
          price: 10,
          desc: "ben 10"
        }
      }

      expect(response).to have_http_status(:found)
      expect(response).to redirect_to(admin_session_path)
    end
  end

  describe "GET /edit" do
    it "returns http sucess" do
      sign_in admin

      get edit_product_path(product)
      expect(response).to have_http_status(:success)
    end

    it "returns http found" do
      get edit_product_path(product)

      expect(response).to have_http_status(:found)
      expect(response).to redirect_to(admin_session_path)
    end

    it "returns http not_found" do
      sign_in admin
      
      get edit_product_path("no_exist")
      expect(response).to have_http_status(:not_found)
    end
  end

  describe "PUT product" do
    it "should update product" do
      sign_in admin

      put product_path(product), params: {
        product: {
          name: "Ben 10",
          sku: "Ben-10",
          price: 10,
          desc: "ben 10"
        }
      }

      expect(response).to have_http_status(:redirect)
    end

    it "should not create without correct value" do
      sign_in admin

      put product_path(product), params: {
        product: {
          name: nil,
          sku: nil,
          price: nil,
          desc: nil
        }
      }

      expect(response).to have_http_status(:unprocessable_entity)
    end

    it "returns http found" do
      put product_path(product), params: {
        product: {
          name: "Ben 10",
          sku: "Ben-10",
          price: 10,
          desc: "ben 10"
        }
      }

      expect(response).to have_http_status(:found)
      expect(response).to redirect_to(admin_session_path)
    end

    it "returns http not_found" do
      sign_in admin
      
      put product_path("no_exist"), params: {
        product: {
          name: "Ben 10",
          sku: "Ben-10",
          price: 10,
          desc: "ben 10"
        }
      }

      expect(response).to have_http_status(:not_found)
    end
  end

  describe "DELETE product" do
    it "should destroy product" do
      sign_in admin

      delete product_path(product)

      expect(response).to have_http_status(:redirect)
    end

    it "returns http found" do
      delete product_path(product)

      expect(response).to have_http_status(:found)
      expect(response).to redirect_to(admin_session_path)
    end

    it "returns http not_found" do
      sign_in admin
      
      delete product_path("no_exist")
      
      expect(response).to have_http_status(:not_found)
    end
  end
end
