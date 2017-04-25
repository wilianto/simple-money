require "rails_helper"

describe PagesController do
  describe "GET /home" do
    it "responses ok" do
      get :home

      expect(response).to have_http_status :ok
      expect(response).to render_template :home
      expect(response).to render_template layout: :blank
    end
  end
end
