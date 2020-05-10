require 'test_helper'

class SignupTest < ActionDispatch::IntegrationTest

   test "invalid signup" do
    get signup_path
    assert_no_difference 'User.count' do
    post signup_path, params: { user: { name:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end

    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
    assert_select 'form[action="/signup"]'
  end

  test "valid signup" do
    get signup_path
    assert_difference 'User.count', 1 do
    post signup_path, params: { user: { name:  "Yosuke Narumi",
                                         email: "user@yyy.com",
                                         password:              "yosuke",
                                         password_confirmation: "yosuke" } }
    end
     follow_redirect!
     assert_template 'users/show'
  end
end
