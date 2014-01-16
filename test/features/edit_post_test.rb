require "test_helper"

feature "Edit a Post" do
  scenario "edit something from an existing post" do
    # Given an existing post with an edit link
    visit posts_path(posts(:one))

    # When I fill form and submit edits
    click_on "Edit"
    fill_in "body", with: posts(:two).body
    click_button "Update Post"

    # Then The post should update and show confirmation
    page.text.must_include posts(:one).title
    page.text.must_include posts(:two).body
  end
end

# error for this one:
# 2) Error:
# Edit a Post Feature Test#test_0001_edit something from an existing post:
# Capybara::Ambiguous: Ambiguous match, found 2 elements matching link or button "Edit"
#     test/features/edit_post_test.rb:9:in `block (2 levels) in <top (required)>'
