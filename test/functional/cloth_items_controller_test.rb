require 'test_helper'

class ClothItemsControllerTest < ActionController::TestCase
  setup do
    @cloth_item = cloth_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cloth_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cloth_item" do
    assert_difference('ClothItem.count') do
      post :create, cloth_item: @cloth_item.attributes
    end

    assert_redirected_to cloth_item_path(assigns(:cloth_item))
  end

  test "should show cloth_item" do
    get :show, id: @cloth_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cloth_item
    assert_response :success
  end

  test "should update cloth_item" do
    put :update, id: @cloth_item, cloth_item: @cloth_item.attributes
    assert_redirected_to cloth_item_path(assigns(:cloth_item))
  end

  test "should destroy cloth_item" do
    assert_difference('ClothItem.count', -1) do
      delete :destroy, id: @cloth_item
    end

    assert_redirected_to cloth_items_path
  end
end
