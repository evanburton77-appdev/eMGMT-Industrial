require "application_system_test_case"

class GptsTest < ApplicationSystemTestCase
  setup do
    @gpt = gpts(:one)
  end

  test "visiting the index" do
    visit gpts_url
    assert_selector "h1", text: "Gpts"
  end

  test "creating a Gpt" do
    visit gpts_url
    click_on "New Gpt"

    fill_in "Content", with: @gpt.content
    fill_in "Role", with: @gpt.role
    fill_in "User", with: @gpt.user_id
    click_on "Create Gpt"

    assert_text "Gpt was successfully created"
    click_on "Back"
  end

  test "updating a Gpt" do
    visit gpts_url
    click_on "Edit", match: :first

    fill_in "Content", with: @gpt.content
    fill_in "Role", with: @gpt.role
    fill_in "User", with: @gpt.user_id
    click_on "Update Gpt"

    assert_text "Gpt was successfully updated"
    click_on "Back"
  end

  test "destroying a Gpt" do
    visit gpts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Gpt was successfully destroyed"
  end
end
