require 'test_helper'

class SpotifysControllerTest < ActionDispatch::IntegrationTest
  test "should get spotify" do
    get spotifys_spotify_url
    assert_response :success
  end

end
