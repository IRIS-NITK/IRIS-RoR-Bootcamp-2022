require "application_system_test_case"

class MytypesTest < ApplicationSystemTestCase
  setup do
    @mytype = mytypes(:one)
  end

  test "visiting the index" do
    visit mytypes_url
    assert_selector "h1", text: "Mytypes"
  end

  test "creating a Mytype" do
    visit mytypes_url
    click_on "New Mytype"

    fill_in "Man", with: @mytype.man
    click_on "Create Mytype"

    assert_text "Mytype was successfully created"
    click_on "Back"
  end

  test "updating a Mytype" do
    visit mytypes_url
    click_on "Edit", match: :first

    fill_in "Man", with: @mytype.man
    click_on "Update Mytype"

    assert_text "Mytype was successfully updated"
    click_on "Back"
  end

  test "destroying a Mytype" do
    visit mytypes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mytype was successfully destroyed"
  end
end
