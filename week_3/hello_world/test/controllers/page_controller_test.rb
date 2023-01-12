require "test_helper"

class PageControllerTest < ActionDispatch::IntegrationTest
  test "should get root" do
    get page_root_url
    assert_response :success
  end

  test "should get about_me" do
    get page_about_me_url
    assert_response :success
  end
end
