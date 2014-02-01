require "test_helper"

# ----------INDEX----------------
feature "Deleting a Post" do
  scenario "editor can delete an existing post from index" do
    # Given a list of existing posts with delete option
    sign_in(:editor)
    visit posts_path
    title = posts(:one).title
    # When I select a post and then select delete
    page.find("tbody tr:last").click_on "Destroy"
    # Then the post is deleted
    page.wont_have_content posts(:one).title
    page.text.must_include "Listing posts"
  end

  scenario "author can delete an existing post from index" do
     # Given a list of existing posts with delete option
    sign_in(:author)
    visit posts_path
    title = posts(:one).title
    # When I select a post and then select delete
    page.find("tbody tr:last").click_on "Destroy"
    # Then the post is deleted
    page.wont_have_content posts(:one).title
    page.text.must_include "Listing posts"
  end

  scenario "a user can't delete posts from index page" do
    # Given a signed in user
    sign_in(:user)
    # When I visit the index
    visit posts_path
    #Then I shouldn't see edit or destroy links
    page.text.wont_include "Destroy"
    page.text.must_include "Listing posts"
  end

    #THIS IS FAILING
  scenario "not signed in can't delete posts from index page" do
    # Given no user is signed in
    # When they visit the post index
    visit posts_path
    # There are no destroy buttons
    page.text.wont_include "Destroy"
    page.text.must_include "Listing posts"
  end

#--------SHOW PAGE-----------(IMPLEMENT LATER)
  # scenario "editor can delete post from show page" do
  #   sign_in(:editor)
  #   visit post_path(posts(:one))
  #   # When I select delete
  #   click_on "Destroy"
  #   # Then the post is deleted
  #   page.wont_have_content posts(:one).title
  #   page.text.must_include "Listing posts"
  # end

  # scenario "author can delete post from show page" do
  #    # Given a list of existing posts with delete option
  #   sign_in(:author)
  #   visit post_path(posts(:one))
  #   # When I select delete
  #   click_on "Destroy"
  #   # Then the post is deleted
  #   page.wont_have_content posts(:one).title
  #   page.text.must_include "Listing posts"
  # end

  # scenario "users can't delete posts from show page" do
  #   # Given a post and a signed-in user
  #   sign_in(:user)
  #   # When I get there
  #   visit post_path(posts(:one))
  #   # Then there is no delete button
  #   page.text.wont_include "Destroy"
  #   page.text.must_include posts(:one).title

  # end

  # scenario "not signed in can't delete posts from show page" do
  #   # Given a post a
  #   # When I get there
  #   visit post_path(posts(:one))
  #   # Then there is no delete button
  #   page.text.wont_include "Destroy"
  #   page.text.must_include posts(:one).title
  # end



end
