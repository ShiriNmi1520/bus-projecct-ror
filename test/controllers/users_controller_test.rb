require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get register" do
    get users_register_url
    assert_response :success
  end

  test "should get login" do
    get users_login_url
    assert_response :success
  end

  test "should get forgotPassword" do
    get users_forgotPassword_url
    assert_response :success
  end

  test "should get verifyToken" do
    get users_verifyToken_url
    assert_response :success
  end

  test "should get resetPassword" do
    get users_resetPassword_url
    assert_response :success
  end
end
