require "test_helper"

feature "Creating A Post" do
  scenario "submit form data to create a new post" do
  # Given a completed new post form
  visit new_posts_path
  fill_in("Title", :with => "My New Post")
  fill_in("Body", :with => "The Text for my new post")

  # When I submit the form
  click_button('Submit Post')

  # Then post should  be created and shown to the author with confirmation message
  page.text.must_include "Post Created"
  page.text.must_include "The Text for my new post"
  end
end
