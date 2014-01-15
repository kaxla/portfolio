require "test_helper"


describe "my portfolio app welcome page" do
  it "shows Welcome index view" do
    visit ""
    page.text.must_include "Hello"
  end
end


