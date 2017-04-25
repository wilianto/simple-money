require "rails_helper"

describe "layouts/blank.html.slim" do
  it "renders session template" do
    render

    expect(rendered).to render_template partial: "layouts/_session"
  end
end
