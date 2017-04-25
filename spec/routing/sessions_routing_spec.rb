require "rails_helper"

describe "routes to login" do
  it "has routes" do
    expect(get "/login").to route_to controller: "sessions", action: "new"
    expect(post "/login").to route_to controller: "sessions", action: "create"
    expect(delete "/logout").to route_to controller: "sessions", action: "destroy"
  end
end
