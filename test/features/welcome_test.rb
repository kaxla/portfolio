require "test_helper"

feature "CanAccessWelcome" do
  scenario "the test is sound" do
    visit root_path
    page.must_have_content "Kayla Morrison"
  end
end


