require "test_helper"

feature "Edit a Post" do
  scenario "edit something from an existing post" do
    # Given an existing post with an edit link
    #post = Post.create(title: "My Post", body: "body of post")
    fill_in "Title", with: posts(:one).title
    fill_in "body", with: posts(:one).body
    visit post_path(post)

    # When I fill form and submit edits
    click_on "Edit"
    fill_in "body", :with => posts(:two).body
    click_button "Update Post"

    # Then The post should update and show confirmation
    page.text.must_include "Editing post"
    page.text.must_include posts(:two).body
  end
end
