ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"
#require "minitest_helper"


# Uncomment for awesome colorful output
# require "minitest/pride"


class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def sign_in(role = :editor)
    visit new_user_session_path
    fill_in "Email", with: users(role).email
    fill_in "Password", with: "password"
    click_button "Sign in"
  end

  def create_post
    sign_in(:author)
    visit new_post_path
    fill_in "Title", with: posts(:unpublished).title
    fill_in "Body", with: posts(:unpublished).body
    click_button "Create Post"
    click_on "Sign Out"
  end
end
