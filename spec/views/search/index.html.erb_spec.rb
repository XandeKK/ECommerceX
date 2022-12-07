require 'rails_helper'

RSpec.describe "search/index.html.erb", type: :view do
  it "display product with query blusa" do
    assign(:results, [
      create(:product),
      create(:product, name: "Naruto"),
    ])

    render

    expect(rendered).to match /Blusa de Ben 10/
    expect(rendered).to match /Naruto/
  end
end
