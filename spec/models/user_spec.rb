require 'rails_helper'

describe User do
  it "has correct db column" do
    is_expected.to have_db_column :name
    is_expected.to have_db_column :email
    is_expected.to have_db_column :password_digest
  end

  context "has validations" do
    it "is a valid data" do
      user = build :user

      expect(user.valid?).to eq true
    end

    context "email" do
      it "must be present" do
        user = build :user, email: ""

        expect(user.valid?).to eq false
      end

      it "must be unique" do
        user = create :user
        duplicate_user = build :user, email: user.email

        expect(duplicate_user.valid?).to eq false
      end

      it "must be valid format" do
        user_1 = build :user, email: "non_valid_format"
        user_2 = build :user, email: "nonvalid@gmail"
        user_3 = build :user, email: "@detik.com"

        expect(user_1.valid?).to eq false
        expect(user_2.valid?).to eq false
        expect(user_3.valid?).to eq false
      end
    end

    context "name" do
      it "must be present" do
        user = build :user, name: ""

        expect(user.valid?).to eq false
      end

      it "has minimum length of 5" do
        user = build :user, name: "wili"

        expect(user.valid?).to eq false
      end

      it "has maximum length of 50" do
        user = build :user, name: "a" * 51

        expect(user.valid?).to eq false
      end
    end

    context "password" do
      it "has minimum length of 5" do
        user = build :user, password: "123", password_confirmation: "123"

        expect(user.valid?).to eq false
      end

      it "is require on create" do
        user = build :user, password: nil, password_confirmation: nil

        expect(user.valid?).to eq false
      end

      it "is not require on update" do
        user = create :user
        user.name = "wilianto new name"

        expect(user.valid?).to eq true
      end
    end
  end
end
