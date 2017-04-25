require "rails_helper"

describe "dashboard/home/index" do
  it "shows logout link" do
    render

    expect(rendered).to be_empty
  end
end
