require 'test_helper'

class Admin::DashboardControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get view" do
    get :view
    assert_response :success
  end

  test "should get list" do
    get :list
    assert_response :success
  end

end
