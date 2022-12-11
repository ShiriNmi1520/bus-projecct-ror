require "test_helper"

class SubscribeControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get subscribe_create_url
    assert_response :success
  end

  test "should get update" do
    get subscribe_update_url
    assert_response :success
  end

  test "should get list" do
    get subscribe_list_url
    assert_response :success
  end

  test "should get delete" do
    get subscribe_delete_url
    assert_response :success
  end
end
