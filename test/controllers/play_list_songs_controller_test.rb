require 'test_helper'

class PlayListSongsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get play_list_songs_create_url
    assert_response :success
  end

  test "should get destroy" do
    get play_list_songs_destroy_url
    assert_response :success
  end

end
