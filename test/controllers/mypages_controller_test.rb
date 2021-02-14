require 'test_helper'

class MypagesControllerTest < ActionDispatch::IntegrationTest
  test "should get email_password" do
    get mypages_email_password_url
    assert_response :success
  end

  test "should get social" do
    get mypages_social_url
    assert_response :success
  end

  test "should get profile" do
    get mypages_profile_url
    assert_response :success
  end

  test "should get account" do
    get mypages_account_url
    assert_response :success
  end

end
