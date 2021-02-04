require 'test_helper'

class PlayListsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get play_lists_new_url
    assert_response :success
  end

  test "should get create" do
    get play_lists_create_url
    assert_response :success
  end

  test "should get show" do
    get play_lists_show_url
    assert_response :success
  end

  test "should get edit" do
    get play_lists_edit_url
    assert_response :success
  end

  test "should get update" do
    get play_lists_update_url
    assert_response :success
  end

  test "should get destroy" do
    get play_lists_destroy_url
    assert_response :success
  end

end
