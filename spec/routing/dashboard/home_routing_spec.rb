require "rails_helper"

describe "routes to dashboard" do
  it "has routes" do
    expect(get "/dashboard").to route_to controller: "dashboard/home",
                                          action: "index"
  end
end
