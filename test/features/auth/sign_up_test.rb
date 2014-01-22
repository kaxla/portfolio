require "test_helper"

feature "creating a user account" do
  scenario "a user is creating an account" do
    # Given a registration
    visit "/"
    click_on "Sign Up"

    # When I fill out the form and submit
    fill_in "Email",  with: "email@email.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Sign up"

    # Then I become a registered user
    page.text.must_include "Welcome! You have signed up successfully"
  end
end
