require "test_helper"

feature "Showing a single project" do
  scenario "I go to a single project page" do
    # Given a single project

    # When I go to a single project's page
    visit project_path(projects(:firstproject).id)

    # Then I only see that project
    page.text.must_include projects(:firstproject).name
    page.text.must_include projects(:firstproject).technologies_used
  end
end
