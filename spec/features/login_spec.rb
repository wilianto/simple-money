require 'rails_helper'

feature "Login", :js do
  let!(:user) { create :user, password: "123456", 
                              password_confirmation: "123456" }

  scenario "Direct access to dashboard" do
    visit dashboard_path

    expect(current_path).to eq login_path
    expect(page).to have_content "Login please!"
  end

  scenario "User want to login" do
    visit root_path

    expect(page).to have_selector "a", text: "Login"

    click_on "Login"

    expect(current_path).to eq login_path

    #login with wrong password
    fill_in "Email", with: user.email
    fill_in "Password", with: "wrongpassword"
    click_button "Login"

    expect(current_path).to eq login_path
    expect(page).to have_content "Login failed!"

    #login with correct password
    fill_in "Email", with: user.email
    fill_in "Password", with: "123456"
    click_button "Login"

    expect(current_path).to eq dashboard_path
    expect(page).to have_content "Login success!"

    #logout
    click_on "Logout"

    expect(current_path).to eq login_path

    #cannot access dashboard again

    visit dashboard_path

    expect(current_path).to eq login_path
    expect(page).to have_content "Login please!"
  end
end
