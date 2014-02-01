require "test_helper"

feature "Edit a Post" do
#--------------INDEX PAGE------------------
  scenario "editor can edit a post from index page" do
    sign_in(:editor)
    visit posts_path
    click_on "Edit"
    fill_in "Body", with: posts(:two).body
    click_button "Update Post"
    page.text.must_include posts(:one).title
    page.text.must_include posts(:two).body
  end

  scenario "author can edit a post from index page" do
    sign_in(:author)
    visit posts_path
    click_on "Edit"
    fill_in "Body", with: posts(:two).body
    click_button "Update Post"
    page.text.must_include posts(:one).title
    page.text.must_include posts(:two).body
  end

  scenario "user can't edit a post from index page" do
    sign_in(:user)
    visit posts_path
    page.text.wont_include "Edit"
  end

  scenario "not signed in can't edit a post from index page" do
    visit posts_path
    page.text.wont_include "Edit"
  end

  #---------------SHOW PAGE-----------------

  # scenario "editor can edit something from show page" do
  #   # Given an existing post with an edit link
  #   sign_in(:editor)
  #   visit post_path(posts(:one))
  #   # When I fill form and submit edits
  #   click_on "Edit"
  #   fill_in "Body", with: posts(:two).body
  #   click_button "Update Post"
  #   # Then The post should update and show confirmation
  #   page.text.must_include posts(:one).title
  #   page.text.must_include posts(:two).body
  # end

  # scenario "an author can edit something from an existing post from show page" do
  #   # Given an existing post with an edit link
  #   sign_in(:author)
  #   visit post_path(posts(:one))
  #   # When I fill form and submit edits
  #   click_on "Edit"
  #   fill_in "Body", with: posts(:two).body
  #   click_button "Update Post"
  #   # Then The post should update and show confirmation
  #   page.text.must_include posts(:one).title
  #   page.text.must_include posts(:two).body
  # end

  #  scenario "a user can't edit posts from show page" do
  #   # Given a signed in user
  #   sign_in(:user)
  #   # When they visit a specific post
  #   visit post_path(posts(:one))
  #    # I can't see an edit link
  #   page.text.wont_include "Edit"
  # end

  #   scenario "not signed in can't edit post from show page" do

  #   end
end
