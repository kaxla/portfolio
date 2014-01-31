require "test_helper"

feature "signing in to an existing account" do
  scenario "an existing user wants to sign in" do
    # Given a an existing user account

    # When I click sign in
    visit "/"
    click_on "Sign in"
    fill_in "Email",  with: users(:one).email
    fill_in "Password", with: "password"
    click_button "Sign in"

    # Then I am signed out
    page.text.must_include "Signed in successfully"
  end
end
