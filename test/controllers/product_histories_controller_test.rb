require 'test_helper'

class ProductHistoriesControllerTest < ActionController::TestCase
  setup do
    @product_history = product_histories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_histories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_history" do
    assert_difference('ProductHistory.count') do
      post :create, product_history: { before_items: @product_history.before_items, change_items: @product_history.change_items, employee_id: @product_history.employee_id, godown_entry_id: @product_history.godown_entry_id, godown_entry_id: @product_history.godown_entry_id, now_items: @product_history.now_items, order_id: @product_history.order_id, product_id: @product_history.product_id }
    end

    assert_redirected_to product_history_path(assigns(:product_history))
  end

  test "should show product_history" do
    get :show, id: @product_history
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product_history
    assert_response :success
  end

  test "should update product_history" do
    patch :update, id: @product_history, product_history: { before_items: @product_history.before_items, change_items: @product_history.change_items, employee_id: @product_history.employee_id, godown_entry_id: @product_history.godown_entry_id, godown_entry_id: @product_history.godown_entry_id, now_items: @product_history.now_items, order_id: @product_history.order_id, product_id: @product_history.product_id }
    assert_redirected_to product_history_path(assigns(:product_history))
  end

  test "should destroy product_history" do
    assert_difference('ProductHistory.count', -1) do
      delete :destroy, id: @product_history
    end

    assert_redirected_to product_histories_path
  end
end
