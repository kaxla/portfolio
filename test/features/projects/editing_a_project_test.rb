require "test_helper"

feature "I want to be able to edit my project for typos/bad ideas" do
  scenario "editing an existing project" do
    # Given an existing post that I want to edit
    visit projects_path
    name = projects(:firstproject).name

    # When I make changes
    click_link("Edit", href: "/projects/#{projects(:firstproject).id}/edit")
    fill_in "Technologies used", with: projects(:secondproject).technologies_used
    click_button "Update Project"

    # Then the changes should be saved and shown
    page.text.must_include projects(:firstproject).name
    page.text.must_include projects(:secondproject).technologies_used
  end
end

feature "I want to be able to edit my project for typos/bad ideas" do
    scenario "user inputs bad edit data" do
        # Given an existing project
        visit edit_project_path(projects(:firstproject))

        # When I submit invalid changes
        fill_in "Name", with: "no"
        fill_in "Technologies used", with: " "
        click_on "Update Project"

        # Then the changes should not be submitted and I should get to try again
        page.text.must_include "Project could not be saved"
        page.text.must_include "Name is too short"
        page.text.must_include "Technologies used can't be blank"
    end
end
