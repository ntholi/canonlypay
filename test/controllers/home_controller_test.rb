require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get home_index_url
    assert_response :success
  end

  test "should get about_us" do
    get home_about_us_url
    assert_response :success
  end

  test "should get privacy_policy" do
    get home_privacy_policy_url
    assert_response :success
  end

  test "should get terms_of_use" do
    get home_terms_of_use_url
    assert_response :success
  end

end
