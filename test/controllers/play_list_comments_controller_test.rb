require 'test_helper'

class PlayListCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get play_list_comments_create_url
    assert_response :success
  end

  test "should get show" do
    get play_list_comments_show_url
    assert_response :success
  end

  test "should get edit" do
    get play_list_comments_edit_url
    assert_response :success
  end

  test "should get update" do
    get play_list_comments_update_url
    assert_response :success
  end

  test "should get destroy" do
    get play_list_comments_destroy_url
    assert_response :success
  end

end
