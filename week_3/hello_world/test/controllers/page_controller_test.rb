require "test_helper"

class PageControllerTest < ActionDispatch::IntegrationTest
  test "should get root" do
    get '/'
    assert_response :success

    assert_select "h1", "Hello, World!"
  end

  test "should get about_me" do
    get "/about_me"
    assert_response :success
  end
end
