require 'rails_helper'

RSpec.describe "home/index.html.erb", type: :view do
  it "display the home" do
    render

    expect(rendered).to match /Home/
  end
end
