require "test_helper"

class MytypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mytype = mytypes(:one)
  end

  test "should get index" do
    get mytypes_url
    assert_response :success
  end

  test "should get new" do
    get new_mytype_url
    assert_response :success
  end

  test "should create mytype" do
    assert_difference('Mytype.count') do
      post mytypes_url, params: { mytype: { man: @mytype.man } }
    end

    assert_redirected_to mytype_url(Mytype.last)
  end

  test "should show mytype" do
    get mytype_url(@mytype)
    assert_response :success
  end

  test "should get edit" do
    get edit_mytype_url(@mytype)
    assert_response :success
  end

  test "should update mytype" do
    patch mytype_url(@mytype), params: { mytype: { man: @mytype.man } }
    assert_redirected_to mytype_url(@mytype)
  end

  test "should destroy mytype" do
    assert_difference('Mytype.count', -1) do
      delete mytype_url(@mytype)
    end

    assert_redirected_to mytypes_url
  end
end
