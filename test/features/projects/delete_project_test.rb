require "test_helper"

feature "deleteing a project" do
  scenario "I want to delete a bad project" do
    # Given a project I want to delete
    visit projects_path

    # When I click on destroy
    click_link("Destroy", href: "/projects/#{projects(:firstproject).id}")

    # Then the project will be deleted
    page.wont_have_content projects(:firstproject).name


  end
end
