require "test_helper"

class BusControllerTest < ActionDispatch::IntegrationTest
  test "should get info" do
    get bus_info_url
    assert_response :success
  end

  test "should get subscribe" do
    get bus_subscribe_url
    assert_response :success
  end

  test "should get unsubscribe" do
    get bus_unsubscribe_url
    assert_response :success
  end

  test "should get update" do
    get bus_update_url
    assert_response :success
  end
end
