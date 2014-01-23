require "test_helper"

feature "Creating A Post" do
  scenario "submit form data to create a new post" do
  # Given a completed new post form
  sign_in

  visit new_post_path
  fill_in "Title", with: posts(:one).title
  fill_in("Body", with: posts(:one).body)

  # When I submit the form
  click_button('Create Post')

  # Then post should  be created and shown to the author with confirmation message
  page.text.must_include "Post was successfully created"
  page.text.must_include posts(:one).title
  page.has_css? "#author"
  page.text.must_include users(:one).email # Use your fixture name here.
  end
end
