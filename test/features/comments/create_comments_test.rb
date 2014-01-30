require "test_helper"

feature "writing comments on posts" do
  scenario "visitor writing a comment" do
    # Given an existing post
    visit post_path(posts(:one))

    # When I create and save a comment
    click_on "Add Comment"
    fill_in "Body", with: comments(:firstcommenter).body
    click_on "Submit"

    # Then the comment shows up
    page.text.must_include "Comment successfully added"
    # page.text.must_include comments(:firstcommenter).body
  end

    scenario "rejecting spam comments" do
    # Given a bad comment
    visit post_path(posts(:one))
    click_on "Add Comment"
    fill_in "Body", with: comments(:buy_penis_pills).body

    # When it is submitted
    click_on "Submit"

    # Then it has to be approved
    page.text.must_include "Comment successfully added"


  end
end
