require "rails_helper"

describe "layouts/application.html.slim" do
  let(:user) { build :user }

  before do
    allow(view).to receive(:current_user).and_return user
  end

  it "renders session template" do
    render

    expect(rendered).to render_template partial: "layouts/_session"
    expect(rendered).to have_selector "a[href='#{logout_path}'][data-remote='true'][data-method='delete']",
                                      text: "Logout"
    expect(rendered).to have_selector "a[href='#{dashboard_path}']", text: "Dashboard"
  end

  context "active menu" do
    it "add active css on dashboard" do
      mock_request = OpenStruct.new path: dashboard_path
      allow(view).to receive(:request).and_return mock_request

      render

      expect(rendered).to have_selector "a.active[href='#{dashboard_path}']", text: "Dashboard"
    end
  end
end
