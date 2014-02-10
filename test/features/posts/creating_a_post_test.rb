require "test_helper"

feature "Creating A Post" do
  scenario "author can create a new post" do
    # Given a completed new post form
    sign_in(:author)
    visit new_post_path
    fill_in "Title", with: posts(:unpublished).title
    fill_in "Body", with: posts(:unpublished).body
    # When I submit the form
    click_button('Create Post')
    # Then post should  be created and shown to the author with confirmation message
    page.text.must_include "Post was successfully created"
    page.text.must_include posts(:unpublished).title
    page.has_css? "#author"
    page.text.must_include users(:author).email
    page.text.must_include "Status: Unpublished"
  end

  scenario "editor can create and publish a new post" do
    # Given a completed new post form
    sign_in
    visit new_post_path
    fill_in "Title", with: posts(:unpublished).title
    fill_in "Body", with: posts(:unpublished).body
    check "Published"
    # When I submit the form
    click_button('Create Post')
    # Then post should  be created and shown to the author with confirmation message
    page.text.must_include "Post was successfully created"
    page.text.must_include posts(:unpublished).title
    page.text.must_include users(:editor).email
    page.text.must_include "Published"
  end

  scenario "user can't create a post" do
    # Given a signed-in user
    sign_in(:user)
    # When I go to post index
    visit posts_path
    # I can't see a create a post link
    page.text.wont_include "Create Post"
  end

  scenario "unauthenticated site visitors cannot visit new_post_path" do
    sign_in(:user)
    visit new_post_path
    page.must_have_content "You do not have access to this area"
  end

  scenario "unauthenticated site vistors cannot see new post button" do
    # When I visit the blog index page
    sign_in(:user)
    visit posts_path
    # Then I should not see the "New Post" button
    page.text.wont_include('New Post')
  end

  scenario "authors can't publish" do
    # Given an author's account
    sign_in(:author)
    # When I visit the new page
    visit new_post_path
    # There is no checkbox for published
    page.wont_have_field('published')
  end

# THIS IS ERRORING BECAUSE IT DOESN'T LIKE THE .EMAIL IN THE SHOW VIEW
# IT WORKS JUST FINE WHEN I DO IT MYSELF IN LOCALHOST, IT'S A CAPYBARA PROBLEM
  scenario "editors can publish from individual post page" do
    # Given an editor's account
    # create_post
    sign_in
    # When I visit the post page, check published, and submit
    visit posts_path
    within("tbody tr:last") { click_link "Show" }

    click_button "Publish"
    # Then the published post should be shown
    page.text.must_include "Status: Published"
  end
end
