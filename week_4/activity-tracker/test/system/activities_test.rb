require "application_system_test_case"

class ActivitiesTest < ApplicationSystemTestCase
  setup do
    @activity = activities(:one)
  end

  test "visiting the index" do
    visit activities_url
    assert_selector "h1", text: "Activities"
  end

  test "should create activity" do
    visit activities_url
    click_on "New activity"

    fill_in "Activity type", with: @activity.activity_type
    fill_in "Calories", with: @activity.calories
    fill_in "Duration", with: @activity.duration
    fill_in "Start", with: @activity.start
    fill_in "Title", with: @activity.title
    click_on "Create Activity"

    assert_text "Activity was successfully created"
    click_on "Back"
  end

  test "should update Activity" do
    visit activity_url(@activity)
    click_on "Edit this activity", match: :first

    fill_in "Activity type", with: @activity.activity_type
    fill_in "Calories", with: @activity.calories
    fill_in "Duration", with: @activity.duration
    fill_in "Start", with: @activity.start
    fill_in "Title", with: @activity.title
    click_on "Update Activity"

    assert_text "Activity was successfully updated"
    click_on "Back"
  end

  test "should destroy Activity" do
    visit activity_url(@activity)
    click_on "Destroy this activity", match: :first

    assert_text "Activity was successfully destroyed"
  end
end
