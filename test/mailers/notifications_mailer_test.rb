require "test_helper"

feature 'Contact page' do
  scenario 'the email form works' do
    visit contact_path
    fill_in "Name", with: "Bob Jones"
    fill_in "Email", with: "bobjones@bobjones.com"
    fill_in "Subject", with: "This is Bob Jones"
    fill_in "Body", with: "Bob Jones"
    click_button "Send"
    page.text.must_include "Hi My Name Is Kayla Morrison"
  end
end
