require 'test_helper'

class HomepageLayoutTest < ActionDispatch::IntegrationTest
 test "Home pages links" do
  get root_path
   assert_template 'home_pages/home'
   assert_select 'a[href=?]', root_path
   assert_select 'a[href=?]', about_path
   assert_select 'a[href=?]', terms_path
   assert_select 'a[href=?]', privacy_path
  get about_path
   assert_select 'title', full_title("RERECとは")
  get signup_path
   assert_select 'title', full_title("新規登録")
 end
end
