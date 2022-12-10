require "rails_helper"

RSpec.describe "routes for Home", :type => :routing do
  it "routes / to action index of home controller" do
    expect(get("/")).
      to route_to(:controller => "home", :action => "index")
  end

  it "routes /home to action index of home controller" do
    expect(get("/home")).
      not_to route_to(:controller => "home", :action => "index")
  end
end
