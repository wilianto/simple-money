require "rails_helper"

describe SessionHelper do
  describe "#logged_in?" do
    context "login" do
      let(:user) { create :user }

      it "return true" do
        allow(helper).to receive(:current_user).and_return true

        expect(helper.logged_in?).to eq true
      end
    end

    context "not login" do
      it "return true" do
        allow(helper).to receive(:current_user).and_return false

        expect(helper.logged_in?).to eq false
      end
    end
  end

  describe "#current_user" do
    context "login" do
      let(:user) { create :user }

      it "return login user" do
        allow(session).to receive(:[]).with(:user_id).and_return user.id

        expect(helper.current_user).to eq user
      end
    end

    context "not login" do
      it "return login user" do
        allow(session).to receive(:[]).with(:user_id).and_return nil

        expect(helper.current_user).to eq nil
      end
    end
  end

  describe "#login" do
    let(:user) { create :user }

    it "set session" do
      helper.login! user
      expect(session[:user_id]).to eq user.id
    end
  end

  describe "#logout" do
    let(:user) { create :user }

    it "unset session" do
      session[:user_id] = user.id
      helper.logout!
      expect(session[:user_id]).to eq nil
    end
  end
end
