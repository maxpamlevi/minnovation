require "test_helper"

class ChatControllerTest < ActionDispatch::IntegrationTest
  test "should get user_connected" do
    get chat_user_connected_url
    assert_response :success
  end

  test "should get incomming_message" do
    get chat_incomming_message_url
    assert_response :success
  end
end
