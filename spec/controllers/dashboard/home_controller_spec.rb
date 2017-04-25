require "rails_helper"

describe Dashboard::HomeController do
  describe "GET /index" do
    context "login" do
      it "responses with 200" do
        allow(controller).to receive(:logged_in?).and_return true
        get :index

        expect(response).to have_http_status :ok
        expect(response).to render_template :index
      end
    end

    context "not login" do
      it "redirects to login page" do
        get :index

        expect(response).to have_http_status 302
        expect(response).to redirect_to login_path
      end
    end
  end
end
