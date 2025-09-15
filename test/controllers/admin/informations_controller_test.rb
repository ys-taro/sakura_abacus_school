require "test_helper"

class Admin::InformationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_informations_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_informations_create_url
    assert_response :success
  end
end
