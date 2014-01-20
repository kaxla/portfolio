require "test_helper"

feature "CanAccessWelcome" do
  scenario "the test is sound" do
    visit "http://www.kaylahowser.com"
    page.must_have_content "Kayla Morrison"
  end
end


