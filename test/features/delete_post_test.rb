require "test_helper"

feature "Deleting a Post" do
  scenario "deleting an existing post" do
    # Given a list of existing posts with delete option
    #post = Post.create(title: "My Post", body: "body of post")
    visit post_path(post)

    # When I select a post and then select delete
    find_link ("My Post").value
    click_on ("Delete")

    # Then the post is deleted
    page.wont_have_content ("My Post")
  end
end
