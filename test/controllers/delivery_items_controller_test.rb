require 'test_helper'

class DeliveryItemsControllerTest < ActionController::TestCase
  setup do
    @delivery_item = delivery_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:delivery_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create delivery_item" do
    assert_difference('DeliveryItem.count') do
      post :create, delivery_item: { amount: @delivery_item.amount, delivery_id: @delivery_item.delivery_id, item_name: @delivery_item.item_name, items: @delivery_item.items, price: @delivery_item.price, status: @delivery_item.status, t_code: @delivery_item.t_code }
    end

    assert_redirected_to delivery_item_path(assigns(:delivery_item))
  end

  test "should show delivery_item" do
    get :show, id: @delivery_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @delivery_item
    assert_response :success
  end

  test "should update delivery_item" do
    patch :update, id: @delivery_item, delivery_item: { amount: @delivery_item.amount, delivery_id: @delivery_item.delivery_id, item_name: @delivery_item.item_name, items: @delivery_item.items, price: @delivery_item.price, status: @delivery_item.status, t_code: @delivery_item.t_code }
    assert_redirected_to delivery_item_path(assigns(:delivery_item))
  end

  test "should destroy delivery_item" do
    assert_difference('DeliveryItem.count', -1) do
      delete :destroy, id: @delivery_item
    end

    assert_redirected_to delivery_items_path
  end
end
