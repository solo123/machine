require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  setup do
    @order = orders(:one)
  end
=begin
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end
=end
  test "should get new" do
    get :new
    assert_response :success
  end

=begin  
  test "should create order" do
    assert_difference('Order.count') do
      post :create, order: { order_date: @order.order_date, order_number: @order.order_number, provider_id: @order.provider_id }, import_text: "01/04/2014\t\t\torder_0001\t801075599990010\tabc\tT-001\tModel-1\tSN-001\t100.01\tmobile123\t\n"
    end

    assert_redirected_to order_path(assigns(:order))
  end
=end

  test "should show order" do
    get :show, id: @order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order
    assert_response :success
  end
=begin
  test "should update order" do
    patch :update, id: @order, order: { order_date: @order.order_date, order_number: @order.order_number, total_amount: @order.total_amount, provider_id: @order.provider_id, status: @order.status }
    assert_redirected_to order_path(assigns(:order))
  end
=end
=begin
  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete :destroy, id: @order
    end

    assert_redirected_to orders_path
  end
=end
end
