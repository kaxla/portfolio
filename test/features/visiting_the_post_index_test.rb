require "test_helper"


feature "visiting the post index site" do
  scenario "with existing posts show list" do
    #Given Existing Posts
    #Post.create(title: "Becoming a Code Fellow", body: "Means striving for excellence")
    #When I visit/posts
    visit posts_path
    #Then the existing posts should be loaded
    page.must_include "Code Fellow"
    end
  end
