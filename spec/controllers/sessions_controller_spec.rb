require "rails_helper"

describe SessionsController do
  describe "GET /new" do
    it "responses ok and renders template" do
      get :new

      expect(response).to have_http_status :ok
      expect(response).to render_template :new
      expect(response).to render_template layout: :blank
    end
  end

  describe "POST /create" do
    let!(:user) { create :user, password: "123456",
                                password_confirmation: "123456" }

    context "login success" do
      it "redirects to dashboard" do
        post :create, params: { session: { email: user.email,
                                           password: "123456" } }

        expect(response).to redirect_to dashboard_path
        expect(flash[:success]).to eq "Login success!"
        expect(session[:user_id]).to eq user.id
      end
    end

    context "login failed" do
      it "renders new and not redirect to dashboard" do
        post :create, params: { session: { email: user.email,
                                           password: "wrongpassword" } }

        expect(response).to render_template :new
        expect(response).not_to redirect_to dashboard_path
        expect(flash.now[:danger]).to eq "Login failed!"
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys session and redirects to login page" do
      delete :destroy

      expect(response).to redirect_to login_path
      expect(flash.now[:success]).to eq "Logout success!"
      expect(session[:user_id]).to eq nil
    end
  end
end
