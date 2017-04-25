require "rails_helper"

describe "layouts/_session.html.slim" do
  it "shows all flash" do
    allow(view).to receive(:flash).and_return({ 
      danger: "Danger!",
      success: "Success!",
      info: "Info!",
      warning: "Warning!"
    })

    render

    expect(rendered).to have_selector ".alert.alert-danger", text: "Danger!"
    expect(rendered).to have_selector ".alert.alert-success", text: "Success!"
    expect(rendered).to have_selector ".alert.alert-info", text: "Info!"
    expect(rendered).to have_selector ".alert.alert-warning", text: "Warning!"
  end
end
