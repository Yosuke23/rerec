require 'test_helper'

class ThirdRegistersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get third_registers_create_url
    assert_response :success
  end

  test "should get destroy" do
    get third_registers_destroy_url
    assert_response :success
  end

end
