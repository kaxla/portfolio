require "test_helper"

feature "Deleting a Post" do
  scenario "deleting an existing post" do
    # Given a list of existing posts with delete option
    # post = Post.create(title: posts(:one).title, body: posts(:one).body)
    visit posts_path

    # When I select a post and then select delete
    page.find("tbody tr:last").click_on "Destroy"

    # Then the post is deleted
    page.wont_have_content (posts(:one).body)
  end
end

# error for this one:
# 1) Error:
# Deleting a Post Feature Test#test_0001_deleting an existing post:
# ActiveRecord::RecordNotFound: Couldn't find Post with id=980190962
#     test/features/delete_post_test.rb:13:in `block (2 levels) in <top (required)>'
