require 'rails_helper'

RSpec.describe "products/show.html.erb", type: :view do
  it "display a product" do
    product = create(:product)
    assign(:product, product)

    render

    expect(rendered).to match product.name
    expect(rendered).to match product.price.to_s
    expect(rendered).to match product.desc
    expect(rendered).to match product.sku
  end
end
