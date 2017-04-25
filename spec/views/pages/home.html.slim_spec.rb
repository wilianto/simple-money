require "rails_helper"

describe "pages/home.html.slim" do
  before do
    render
  end

  it "shows buy section" do
    expect(rendered).to have_content "Buy"
  end

  it "shows sell section" do
    expect(rendered).to have_content "Sell"
  end

  it "shows server time" do
    expect(render).to have_content DateTime.now
  end

  it "shows login link" do
    expect(rendered).to have_selector "a[href='#{login_path}']", text: "Login"
  end
end
