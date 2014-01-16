require "test_helper"

feature "Deleting a Post" do
  scenario "deleting an existing post" do
    # Given a list of existing posts with delete option
    #post = Post.create(title: "My Post", body: "body of post")
    fill_in("Title", :with => "My New Post")
    fill_in("Body", :with => "The Text for my new post")
    visit post_path(post)

    # When I select a post and then select delete
    find_link (posts(:one).title).value
    click_on ("Delete")

    # Then the post is deleted
    page.wont_have_content (posts(:one).body).value
  end
end
