require "rails_helper"

RSpec.describe "routes for Home", :type => :routing do
  it "routes /search to action index of search controller" do
    expect(get("/search")).
      to route_to(:controller => "search", :action => "index")
  end
end
