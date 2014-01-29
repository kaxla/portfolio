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
  end

