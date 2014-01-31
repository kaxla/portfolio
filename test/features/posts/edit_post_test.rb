require "test_helper"

feature "Edit a Post" do
  scenario "editor can edit something from an existing post" do
    # Given an existing post with an edit link
    sign_in(:editor)
    visit post_path(posts(:one))
    # When I fill form and submit edits
    click_on "Edit"
    fill_in "Body", with: posts(:two).body
    click_button "Update Post"
    # Then The post should update and show confirmation
    page.text.must_include posts(:one).title
    page.text.must_include posts(:two).body
  end

  scenario "an author can edit something from an existing post" do
    # Given an existing post with an edit link
    sign_in(:author)
    visit post_path(posts(:one))
    # When I fill form and submit edits
    click_on "Edit"
    fill_in "Body", with: posts(:two).body
    click_button "Update Post"
    # Then The post should update and show confirmation
    page.text.must_include posts(:one).title
    page.text.must_include posts(:two).body
  end

# THIS IS FAILING
    scenario "a user can't edit posts" do
    # Given a signed in user
    sign_in(:user)
    # When they visit a specific post
    visit post_path(posts[:one])
    # I can't see an edit link
    page.text.wont_include "Destroy"
  end
end
