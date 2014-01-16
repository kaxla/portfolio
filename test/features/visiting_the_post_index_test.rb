require "test_helper"


feature "visiting the post index site" do
  scenario "with existing posts show list" do
    #Given Existing Posts
    Post.create(title: posts(:one).title, body: posts(:one).body)

    #When I visit/posts
    visit posts_path

    #Then the existing posts should be loaded
    page.text.must_include posts(:one).title
    page.text.must_include posts(:one).body
    end
  end
