require "test_helper"

feature "showing a single post" do
  scenario "a user visits to read posts" do
    # Given a signed-in user
    sign_in(:user)
    # When I visit a single post
    visit post_path(posts(:one))
    # Then there should be a post there
    page.text.must_include posts(:one).title
    page.text.must_include posts(:one).body
  end

  scenario "unsigned in person can't delete post" do
    # Given a not signed in person
    # When they visit a single post
    visit post_path(posts(:one))
    # Then there should not be a destroy button
    page.text.wont_include "Destroy"
  end

# THIS IS FAILING
  scenario "unsigned in person can't edit post" do
    # Given unsigned in person
    # When they visit a specific post
    visit post_path(posts(:one))
    # Then there should not be an edit button
    page.text.wont_include "Edit"
  end
end
