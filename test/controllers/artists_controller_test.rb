require 'test_helper'

class ArtistsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get artists_create_url
    assert_response :success
  end

  test "should get destroy" do
    get artists_destroy_url
    assert_response :success
  end

end
