require "rails_helper"

describe "sessions/new.html.slim" do
  before do
    render
  end

  it "shows login form" do
    expect(rendered).to have_selector "form[action='#{login_path}']"
    expect(rendered).to have_selector "input#session_email"
    expect(rendered).to have_selector "input#session_password"
    expect(rendered).to have_selector "input[type='submit'][value='Login']"
  end
end
