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

  describe "GET /new" do
    it "returns http sucess" do
      admin = create(:admin)
      sign_in admin

      get new_product_path
      expect(response).to have_http_status(:success)
    end

    it "returns http redirect" do
      get new_product_path
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "POST product" do
    it "should create product" do
      admin = create(:admin)
      sign_in admin

      before_count_product = Product.count

      post products_path, params: {
        product: {
          name: "Ben 10",
          sku: "Ben-10",
          price: 10,
          desc: "ben 10"
        }
      }

      actual_count_product = Product.count

      expect(before_count_product).to be < actual_count_product
      expect(response).to have_http_status(:redirect)
    end

    it "should not create without correct value" do
      admin = create(:admin)
      sign_in admin

      before_count_product = Product.count

      post products_path, params: {
        product: {
          name: nil,
          sku: nil,
          price: nil,
          desc: nil
        }
      }

      actual_count_product = Product.count

      expect(before_count_product).to be == actual_count_product
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it "returns http redirect" do
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
  end

  describe "GET /edit" do
    let(:product) { create(:product) }

    it "returns http sucess" do
      admin = create(:admin)
      sign_in admin

      get edit_product_path(product)
      expect(response).to have_http_status(:success)
    end

    it "returns http redirect" do
      get new_product_path
      edit_product_path(product)
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "PUT product" do
    it "should update product" do
      admin = create(:admin)
      sign_in admin
      product = create(:product)

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
      admin = create(:admin)
      sign_in admin
      product = create(:product)

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

    it "returns http redirect" do
      put product_path(0), params: {
        product: {
          name: "Ben 10",
          sku: "Ben-10",
          price: 10,
          desc: "ben 10"
        }
      }

      expect(response).to have_http_status(:redirect)
    end
  end

  describe "DELETE product" do
    it "should destroy product" do
      admin = create(:admin)
      sign_in admin
      product = create(:product)
      before_count_product = Product.count

      delete product_path(product)

      actual_count_product = Product.count

      expect(actual_count_product).to be < before_count_product
      expect(response).to have_http_status(:redirect)
    end

    it "returns http redirect" do
      delete product_path(0)

      expect(response).to have_http_status(:redirect)
    end
  end
end
