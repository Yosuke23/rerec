require 'test_helper'

class HomePagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_path
    assert_response :success
  end

  test "should get about" do
    get about_url
    assert_response :success
  end

  test "should get help" do
    get terms_url
    assert_response :success
  end

  test "should get contact" do
    get privacy_url
    assert_response :success
  end
 
  

end
