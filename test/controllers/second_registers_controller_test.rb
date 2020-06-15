require 'test_helper'

class SecondRegistersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get second_registers_create_url
    assert_response :success
  end

  test "should get destroy" do
    get second_registers_destroy_url
    assert_response :success
  end

end
