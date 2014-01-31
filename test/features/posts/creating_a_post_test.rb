require "test_helper"

feature "Creating A Post" do
  scenario "author can create a new post" do
    # Given a completed new post form
    sign_in(:author)
    visit new_post_path
    fill_in "Title", with: posts(:one).title
    fill_in("Body", with: posts(:one).body)
    # When I submit the form
    click_button('Create Post')
    # Then post should  be created and shown to the author with confirmation message
    page.text.must_include "Post was successfully created"
    page.text.must_include posts(:one).title
    page.has_css? "#author"
    page.text.must_include users(:author).email
    page.text.must_include "Status: Unpublished"
  end

  scenario "editor can create and publish a new post" do
    # Given a completed new post form
    sign_in(:editor)
    visit new_post_path
    fill_in "Title", with: posts(:one).title
    fill_in "Body", with: posts(:one).body
    check "Published"
    # When I submit the form
    click_button('Create Post')
    # Then post should  be created and shown to the author with confirmation message
    save_and_open_page
    page.text.must_include "Post was successfully created"
    page.text.must_include posts(:one).title
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

# THIS IS FAILING
  scenario "unauthenticated site visitors cannot visit new_post_path" do
    sign_in(:user)
    visit new_post_path
    page.must_have_content "You need to sign in or sign up before continuing"
  end

# THIS IS FAILING
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

# THIS IS FAILING
  scenario "editors can publish individual post page" do
    # Given an editor's account
    sign_in(:editor)
    # When I visit the new page
    visit post_path(posts(:unpublished))
    save_and_open_page
    click_link "Edit"
    # When I submit the form
    check "Published"
    click_on "Update Post"

    # Then the published post should be shown
    page.text.must_include "Status: Published"
  end
end
