require "test_helper"

feature "Showing an index of all projects" do
  scenario "I want to see an index of all of my projects" do
    # Given an group of projects

    # When I visit /projects
    visit projects_path

    # Then it lists all of my projects
    page.text.must_include projects(:firstproject).name
  end
end
