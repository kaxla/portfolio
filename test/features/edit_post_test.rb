require "test_helper"

feature "Edit a Post" do
  scenario "edit something from an existing post" do
    # Given an existing post with an edit link
    visit post_path(posts(:one))

    # When I fill form and submit edits
    click_on "Edit"
    fill_in "Body", with: posts(:two).body
    click_button "Update Post"

    # Then The post should update and show confirmation
    page.text.must_include posts(:one).title
    page.text.must_include posts(:two).body
  end
end
