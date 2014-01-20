require "test_helper"

feature "not-ugly portfolio site" do
  scenario "check that the site is using Zurb as a front-end framework" do
# given an existing blog post

# when I visit it
visit post_path(posts(:one))

# Then the body contains columns
page.html.must_include("columns")
  end
end


