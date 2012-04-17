require 'test_helper'

class ClothsControllerTest < ActionController::TestCase
  setup do
    @cloth = cloths(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cloths)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cloth" do
    assert_difference('Cloth.count') do
      post :create, cloth: @cloth.attributes
    end

    assert_redirected_to cloth_path(assigns(:cloth))
  end

  test "should show cloth" do
    get :show, id: @cloth
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cloth
    assert_response :success
  end

  test "should update cloth" do
    put :update, id: @cloth, cloth: @cloth.attributes
    assert_redirected_to cloth_path(assigns(:cloth))
  end

  test "should destroy cloth" do
    assert_difference('Cloth.count', -1) do
      delete :destroy, id: @cloth
    end

    assert_redirected_to cloths_path
  end
end
