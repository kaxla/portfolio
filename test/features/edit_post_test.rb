require "test_helper"

feature "Edit a Post" do
  scenario "edit something from an existing post" do
    # Given an existing post with an edit link
    post = Post.create(title: "My Post", body: "body of post")
    visit post_path(post)

    # When I fill form and submit edits
    click_on "Edit"
    fill_in "body", :with => "edited body of post"
    click_button "Update Post"

    # Then The post should update and show confirmation
    page.text.must_include "Post Updated"
    page.text.must_include "edited body of post"
  end
end
