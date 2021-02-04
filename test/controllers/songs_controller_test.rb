require 'test_helper'

class SongsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get songs_create_url
    assert_response :success
  end

  test "should get destroy" do
    get songs_destroy_url
    assert_response :success
  end

end
