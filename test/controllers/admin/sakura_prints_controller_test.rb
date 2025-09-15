require "test_helper"

class Admin::SakuraPrintsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_sakura_prints_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_sakura_prints_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_sakura_prints_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_sakura_prints_update_url
    assert_response :success
  end

  test "should get show" do
    get admin_sakura_prints_show_url
    assert_response :success
  end
end
