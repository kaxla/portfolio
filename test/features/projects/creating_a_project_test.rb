require "test_helper"

feature "Creating A new project to show off my work" do
  scenario "on the projects page, want to create a new one" do

    # A project I want to show off
    visit project_path
    click_on "New Project"
    fill_in "Name", with: projects(:cool_website).title
    fill_in("Technologies", with: projects(:cool_website).languages_used)

    # When I submit the form
    click_button('Create Project')

    # Then post should  be created and shown to the author with confirmation message
    page.text.must_include "Project has been created"
    page.text.must_include projects(:cool_website).title
  end
end

