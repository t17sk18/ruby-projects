require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard/control" do
    get information_index_url
    assert_response :success
  end

end
