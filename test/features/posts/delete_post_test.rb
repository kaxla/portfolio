require "test_helper"

feature "Deleting a Post" do
  scenario "editor deleting an existing post" do
    # Given a list of existing posts with delete option
    sign_in(:editor)
    visit posts_path
    title = posts(:one).title

    # When I select a post and then select delete
    page.find("tbody tr:last").click_on "Destroy"

    # Then the post is deleted
    page.wont_have_content posts(:one).title
  end

  scenario "users can't delete posts" do
    # Given a post and a signed-in user
    sign_in(:user)
    visit post_path(posts(:one))
    # When I get there
    visit post_path(posts(:one))
    # Then there is no delete button
    page.text.wont_include "Destroy"
  end
#THIS IS FAILING
  scenario "not signed in can't delete posts" do
    # Given no user is signed in
    # When they visit the post index
    visit posts_path
    # There are no destroy buttons
    page.text.wont_include "Destroy"
  end
end
