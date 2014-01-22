require "test_helper"

feature "Deleting a Post" do
  scenario "deleting an existing post" do
    # Given a list of existing posts with delete option
    visit posts_path
    title = posts(:one).title

    # When I select a post and then select delete
    page.find("tbody tr:last").click_on "Destroy"

    # Then the post is deleted
    page.wont_have_content posts(:one).title
  end
end
