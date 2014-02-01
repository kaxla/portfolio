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
end
