require "rails_helper"

RSpec.describe "routes for Products", :type => :routing do
  let(:product) { create(:product) }
  
  it "routes /products/:id to action show of products controller" do
    expect(get("/products/#{product.id}")).
      to route_to(:controller => "products", :action => "show", id: product.id)
  end

  it "routes /products/new to action new of products controller" do
    expect(get("/products/new")).
      to route_to(:controller => "products", :action => "new")
  end

  it "routes /products/:id/edit to action edit of products controller" do
    expect(get("/products/#{product.id}/edit")).
      to route_to(:controller => "products", :action => "edit", id: product.id)
  end

  it "routes /products to action create of products controller" do
    expect(post("/products")).
      to route_to(:controller => "products", :action => "create")
  end

  it "routes /products to action update of products controller" do
    expect(put("/products/#{product.id}")).
      to route_to(:controller => "products", :action => "update", id: product.id)
  end

  it "routes /products to action delete of products controller" do
    expect(delete("/products/#{product.id}")).
      to route_to(:controller => "products", :action => "destroy", id: product.id)
  end
end
