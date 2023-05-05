require "application_system_test_case"

class MessagesTest < ApplicationSystemTestCase
  setup do
    @message = messages(:one)
  end

  test "visiting the index" do
    visit messages_url
    assert_selector "h1", text: "Messages"
  end

  test "creating a Message" do
    visit messages_url
    click_on "New Message"

    fill_in "Agent", with: @message.agent_id
    fill_in "Content", with: @message.content
    fill_in "Reaction manager", with: @message.reaction_manager
    fill_in "Reaction user", with: @message.reaction_user
    check "Read receipt manager" if @message.read_receipt_manager
    check "Read receipt user" if @message.read_receipt_user
    fill_in "Subject", with: @message.subject
    fill_in "User", with: @message.user_id
    click_on "Create Message"

    assert_text "Message was successfully created"
    click_on "Back"
  end

  test "updating a Message" do
    visit messages_url
    click_on "Edit", match: :first

    fill_in "Agent", with: @message.agent_id
    fill_in "Content", with: @message.content
    fill_in "Reaction manager", with: @message.reaction_manager
    fill_in "Reaction user", with: @message.reaction_user
    check "Read receipt manager" if @message.read_receipt_manager
    check "Read receipt user" if @message.read_receipt_user
    fill_in "Subject", with: @message.subject
    fill_in "User", with: @message.user_id
    click_on "Update Message"

    assert_text "Message was successfully updated"
    click_on "Back"
  end

  test "destroying a Message" do
    visit messages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Message was successfully destroyed"
  end
end
