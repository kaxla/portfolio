require "test_helper"

feature "writing comments on posts" do
  scenario "visitor writing a comment" do
    # Given an existing post
    visit post_path(posts(:one))

    # When I create and save a comment
    fill_in "Body", with: comments(:firstcommenter).body
    click_on "Create Comment"

    # Then the comment shows up
    page.text.must_include "Comment was successfully created."
    page.text.must_include comments(:firstcommenter).body
  end

    scenario "rejecting spam comments" do
    # Given a bad comment
    sign_in(user)
    visit post_path(posts(:one))
    fill_in "Body", with: comments(:buy_penis_pills).body

    # When it is submitted
    click_on "Create Comment"

    # Then it has to be approved
    page.text.must_include "Comment was successfully created."
    page.text.must_not_include "Seriously penis pills"


  end
end
