require "test_helper"

feature "visiting the post index site" do
  scenario "with existing posts show list" do
    #Given Existing Posts
    #When I visit/posts
    visit posts_path
    #Then the existing posts should be loaded
    page.text.must_include posts(:one).title
    page.text.must_include posts(:one).body
    end

# THIS IS FAILING
  scenario "an author is logged in, wants to see only his/her posts" do
    # Given an author with existing posts
    sign_in(:author)
    # When I visit the author's posts index
    visit posts_path
    click_on "See My Posts"
    # Then I only see posts written by me
    page.text.must_include posts(:one).title
    page.text.wont_include posts(:two).title
  end

  scenario "an editor should be able to see all posts, including unpublished" do
    # Given published and unpublished posts and a signed in editor
    sign_in(:editor)
    # When I visit the index
    visit posts_path
    # Then I should see all posts (even unpublished)
    page.text.must_include posts(:unpublished).title
  end

# THIS IS FAILING
  scenario "A user can't see drafts" do
    # Given a signed-in user
    sign_in(:user)
    # When I visit the index
    visit posts_path
    # Then I shouldn't see unpublished posts
    page.text.wont_include posts(:unpublished).title
  end
end

