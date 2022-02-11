require "application_system_test_case"

class SendMessagesTest < ApplicationSystemTestCase
  setup do
    @send_message = send_messages(:one)
  end

  test "visiting the index" do
    visit send_messages_url
    assert_selector "h1", text: "Send Messages"
  end

  test "creating a Send message" do
    visit send_messages_url
    click_on "New Send Message"

    fill_in "Cash", with: @send_message.cash
    fill_in "Driver", with: @send_message.driver_id
    fill_in "First weight", with: @send_message.first_weight
    fill_in "Net weight", with: @send_message.net_weight
    fill_in "Party", with: @send_message.party_id
    fill_in "Product", with: @send_message.product
    fill_in "Second weight", with: @send_message.second_weight
    fill_in "Srial number", with: @send_message.srial_number
    fill_in "Vehicle number", with: @send_message.vehicle_number
    fill_in "Weight type", with: @send_message.weight_type
    click_on "Create Send message"

    assert_text "Send message was successfully created"
    click_on "Back"
  end

  test "updating a Send message" do
    visit send_messages_url
    click_on "Edit", match: :first

    fill_in "Cash", with: @send_message.cash
    fill_in "Driver", with: @send_message.driver_id
    fill_in "First weight", with: @send_message.first_weight
    fill_in "Net weight", with: @send_message.net_weight
    fill_in "Party", with: @send_message.party_id
    fill_in "Product", with: @send_message.product
    fill_in "Second weight", with: @send_message.second_weight
    fill_in "Srial number", with: @send_message.srial_number
    fill_in "Vehicle number", with: @send_message.vehicle_number
    fill_in "Weight type", with: @send_message.weight_type
    click_on "Update Send message"

    assert_text "Send message was successfully updated"
    click_on "Back"
  end

  test "destroying a Send message" do
    visit send_messages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Send message was successfully destroyed"
  end
end
