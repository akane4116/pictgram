require 'test_helper'

class PasgesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pasges_index_url
    assert_response :success
  end

end
