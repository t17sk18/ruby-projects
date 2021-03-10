require 'test_helper'

class LivetennisnewsControllerTest < ActionDispatch::IntegrationTest
  test "should get news" do
    get livetennisnews_news_url
    assert_response :success
  end

end
