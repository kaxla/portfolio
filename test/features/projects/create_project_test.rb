require "test_helper"

feature "As the site owner, I want to add a portfolio item so that I can show off my work" do
  scenario "adding a new project" do
    visit projects_path
    click_on "New project"
    fill_in "Name", with: "Code Fellows Portfolio"
    fill_in "Technologies used", with: "Rails, Ruby, Bootstrap, HTML5, CSS3"
    click_on "Create Project"
    page.text.must_include "Project has been created"
    page.text.must_include "Code Fellows Portfolio"
    page.text.must_include "Rails"
  end
end

feature "As the site owner, I went to add a portfolio" do
    scenario "new project has invalid data" do
    #Given invalid project data is submitted to the form
    visit new_project_path
    # WHen the form is submitted with a short name and missing technologies used section
    fill_in "Name", with: "a"
    click_on "Create Project"
    # Then the form should re-display with an error message.
    current_path.must_match /projects$/
    page.text.must_include "Project could not be saved"
    page.text.must_include "Name is too short"
    page.text.must_include "Technologies used can't be blank"
  end
end
