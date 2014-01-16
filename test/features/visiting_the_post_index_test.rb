require "test_helper"


feature "visiting the post index site" do
  scenario "with existing posts show list" do
    #Given Existing Posts
    #Post.create(title: "Becoming a Code Fellow", body: "Means striving for excellence")
    fill_in "Title", with: posts(:one).title
    fill_in "Body", with: posts(:one).body
    #When I visit/posts
    visit new_posts_path

    #Then the existing posts should be loaded
    page.must_include posts(:one).title
    page.must_include posts(:one).body
    end
  end
