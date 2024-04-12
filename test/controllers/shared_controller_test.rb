require "test_helper"

class SharedControllerTest < ActionDispatch::IntegrationTest
  test "should get _second-header" do
    get shared__second-header_url
    assert_response :success
  end
end
