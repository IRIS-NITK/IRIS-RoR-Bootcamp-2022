require "test_helper"

class ActivitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:steve)
    @activity = activities(:one)
  end

  test "should not get index if signed out" do
    sign_out users(:steve)
    get activities_url
    assert_response :redirect
  end

  test "should get index" do
    get activities_url
    assert_response :success
  end

  test "should get new" do
    get new_activity_url
    assert_response :success
  end

  test "should create activity" do
    assert_difference("Activity.count") do
      post activities_url, params: { activity: { activity_type: @activity.activity_type, calories: @activity.calories, duration: @activity.duration, start: @activity.start, title: @activity.title } }
    end

    assert_redirected_to activity_url(Activity.last)
  end

  test "should show activity" do
    get activity_url(@activity)
    assert_response :success
  end

  test "should get edit" do
    get edit_activity_url(@activity)
    assert_response :success
  end

  test "should update activity" do
    patch activity_url(@activity), params: { activity: { activity_type: @activity.activity_type, calories: @activity.calories, duration: @activity.duration, start: @activity.start, title: @activity.title } }
    assert_redirected_to activity_url(@activity)
  end

  test "should destroy activity" do
    assert_difference("Activity.count", -1) do
      delete activity_url(@activity)
    end

    assert_redirected_to activities_url
  end

  test "should get stats" do
    get stats_activities_url
    assert_response :success
    expected_calories = Activity.sum(&:calories)
    expected_duration = Activity.sum(&:duration)
    cal = assigns(:total_calories)
    dur = assigns(:total_duration)
    assert_equal(expected_calories, cal)
    assert_equal(expected_duration, dur)
  end
end
