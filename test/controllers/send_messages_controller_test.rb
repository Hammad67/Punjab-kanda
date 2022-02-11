require "test_helper"

class SendMessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @send_message = send_messages(:one)
  end

  test "should get index" do
    get send_messages_url
    assert_response :success
  end

  test "should get new" do
    get new_send_message_url
    assert_response :success
  end

  test "should create send_message" do
    assert_difference('SendMessage.count') do
      post send_messages_url, params: { send_message: { cash: @send_message.cash, driver_id: @send_message.driver_id, first_weight: @send_message.first_weight, net_weight: @send_message.net_weight, party_id: @send_message.party_id, product: @send_message.product, second_weight: @send_message.second_weight, srial_number: @send_message.srial_number, vehicle_number: @send_message.vehicle_number, weight_type: @send_message.weight_type } }
    end

    assert_redirected_to send_message_url(SendMessage.last)
  end

  test "should show send_message" do
    get send_message_url(@send_message)
    assert_response :success
  end

  test "should get edit" do
    get edit_send_message_url(@send_message)
    assert_response :success
  end

  test "should update send_message" do
    patch send_message_url(@send_message), params: { send_message: { cash: @send_message.cash, driver_id: @send_message.driver_id, first_weight: @send_message.first_weight, net_weight: @send_message.net_weight, party_id: @send_message.party_id, product: @send_message.product, second_weight: @send_message.second_weight, srial_number: @send_message.srial_number, vehicle_number: @send_message.vehicle_number, weight_type: @send_message.weight_type } }
    assert_redirected_to send_message_url(@send_message)
  end

  test "should destroy send_message" do
    assert_difference('SendMessage.count', -1) do
      delete send_message_url(@send_message)
    end

    assert_redirected_to send_messages_url
  end
end
