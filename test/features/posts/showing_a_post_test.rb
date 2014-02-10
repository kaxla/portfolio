require "test_helper"

feature "showing a single post" do
  scenario "a user visits to read posts" do
    # Given a signed-in user
    sign_in(:user)
    # When I visit a single post
    visit post_path(posts(:published))
    # Then there should be a post there
    page.text.must_include posts(:published).title
    page.text.must_include posts(:published).body
  end

  scenario "a user can't see publish button" do
    sign_in(:user)
    visit post_path(posts(:published))
    page.has_no_button? "Publish"
  end
end
