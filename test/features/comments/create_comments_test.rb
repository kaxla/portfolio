require "test_helper"

feature "writing comments on posts" do
  scenario "visitors can write comments" do
    # Given an existing post
    visit post_path(posts(:published))
    # When I create and save a comment
    fill_in "Body", with: comments(:firstcommenter).body
    click_on "Create Comment"
    # Then the comment shows up and I'm taken back to post
    page.text.must_include "Comment was successfully created."
    page.text.must_include posts(:published).body
  end

    scenario "author or editor a able to moderate comments before they appear" do
    # Given a bad comment
    sign_in(:user)
    visit post_path(posts(:published))
    fill_in "Body", with: comments(:buy_penis_pills).body
    # When it is submitted
    click_on "Create Comment"
    # Then it has to be approved
    page.text.must_include "Comment was successfully created."
    page.text.must_include posts(:published).body
    page.text.wont_include "Seriously penis pills"
  end
#need to change to reflect switch to approve in post

  # scenario "author can moderate comments by checking box on comment index page" do
  #   # Given some comments and a signed in author or editor
  #   sign_in(:author)
  #   # When I go to the index page
  #   visit post_path(posts(:published))
  #   # Then there is a checkbox for me to click to approve
  #   page.must_include "Approve"
  # end

  # scenario "editor can moderate comments by checing box on comment index page" do
  #   # Given some comments and a signed in author or editor
  #   sign_in(:editor)
  #   # When I go to the index page
  #   visit post_path(posts(:published))
  #   # Then there is a checkbox for me to click to approve
  #   page.text.must_include "Approve"
  # end

end
