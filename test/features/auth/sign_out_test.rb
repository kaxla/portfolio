require "test_helper"

feature "signing out of a user account" do
  scenario "a user wants to sign out" do
    # Given a signed-in account
    visit "/"
    click_on "Sign in"
    fill_in "Email",  with: users(:one).email
    fill_in "Password", with: "password"
    # fill_in "Password confirmation", with: password
    click_button "Sign in"

    # When I click sign out
    click_on "Sign Out"

    # Then I am signed out
    page.text.must_include "Signed out successfully"

  end
end



