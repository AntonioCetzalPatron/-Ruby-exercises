require 'test_helper'

class HomieControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get homie_index_url
    assert_response :success
  end

end
