require "test_helper"


describe "my portfolio app welcome page" do
  it "shows Welcome index view" do
    visit "http://localhost:3000"
    page.text.must_include "Hello"
  end
end


