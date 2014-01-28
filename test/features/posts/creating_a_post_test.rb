require "test_helper"

feature "Creating A Post" do
  scenario "submit form data to create a new post" do
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
  page.text.must_include users(:one).email # Use your fixture name here.
  page.text.must_include "Status: Unpublished"
  end

    scenario "unauthenticated site visitors cannot visit new_post_path" do
    visit new_post_path
    page.must_have_content "You need to sign in or sign up before continuing"
  end

    scenario "unauthenticated site vistiors cannot see new post button" do
    # When I visit the blog index page
    visit posts_path
    # Then I should not see the "New Post" button
    page.wont_have_link "New Post"
  end

    scenario "authors can't publish" do
    # Given an author's account
    sign_in(:author)

    # When I visit the new page
    visit new_post_path

    # There is no checkbox for published
    page.wont_have_field('published')
  end

  scenario "editors can publish" do
    # Given an editor's account
    sign_in(:editor)

    # When I visit the new page
    visit new_post_path

    # There is a checkbox for published
    page.must_have_field('Published')

    # When I submit the form
    fill_in "Title", with: posts(:cr).title
    fill_in "Body", with: posts(:cr).body
    check "Published"
    click_on "Create Post"

    # Then the published post should be shown
    page.text.must_include "Status: Published"
  end
end
