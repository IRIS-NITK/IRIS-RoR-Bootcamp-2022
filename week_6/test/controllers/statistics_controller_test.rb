require "test_helper"

class StatisticsControllerTest < ActionDispatch::IntegrationTest
  test "should get stats" do
    get statistics_stats_url
    assert_response :success
  end
end
