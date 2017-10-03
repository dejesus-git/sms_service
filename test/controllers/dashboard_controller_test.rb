require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dashboard_path
    assert_response :success
  end

  # test "should get uploads" do
  #   get dashboard_uploads_url
  #   assert_response :success
  # end

  # test "should get account" do
  #   get dashboard_account_url
  #   assert_response :success
  # end

end
