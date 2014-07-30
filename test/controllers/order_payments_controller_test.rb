require 'test_helper'

class OrderPaymentsControllerTest < ActionController::TestCase
  setup do
    @order_payment = order_payments(:one)
    sign_in employees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:order_payments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order_payment" do
    assert_difference('OrderPayment.count') do
      post :create, order_payment: { balance: @order_payment.balance, balance_before: @order_payment.balance_before, order_id: @order_payment.order_id, pay_amount: @order_payment.pay_amount }
    end

  end

  test "should show order_payment" do
    get :show, id: @order_payment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order_payment
    assert_response :success
  end

  test "should update order_payment" do
    patch :update, id: @order_payment, order_payment: { balance: @order_payment.balance, balance_before: @order_payment.balance_before, order_id: @order_payment.order_id, pay_amount: @order_payment.pay_amount }
  end

  test "should destroy order_payment" do
    assert_difference('OrderPayment.count', -1) do
      delete :destroy, id: @order_payment
    end

    assert_redirected_to order_payments_path
  end
end
