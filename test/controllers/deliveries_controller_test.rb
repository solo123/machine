require 'test_helper'

class DeliveriesControllerTest < ActionController::TestCase
  setup do
    @delivery = deliveries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:deliveries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create delivery" do
    assert_difference('Delivery.count') do
      post :create, delivery: { accounting_voucher_number: @delivery.accounting_voucher_number, creator_id: @delivery.creator_id, delivery_date: @delivery.delivery_date, delivery_number: @delivery.delivery_number, delivery_staff_id: @delivery.delivery_staff_id, partner_id: @delivery.partner_id, status: @delivery.status, total_amount: @delivery.total_amount, total_items: @delivery.total_items }
    end

    assert_redirected_to delivery_path(assigns(:delivery))
  end

  test "should show delivery" do
    get :show, id: @delivery
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @delivery
    assert_response :success
  end

  test "should update delivery" do
    patch :update, id: @delivery, delivery: { accounting_voucher_number: @delivery.accounting_voucher_number, creator_id: @delivery.creator_id, delivery_date: @delivery.delivery_date, delivery_number: @delivery.delivery_number, delivery_staff_id: @delivery.delivery_staff_id, partner_id: @delivery.partner_id, status: @delivery.status, total_amount: @delivery.total_amount, total_items: @delivery.total_items }
    assert_redirected_to delivery_path(assigns(:delivery))
  end

  test "should destroy delivery" do
    assert_difference('Delivery.count', -1) do
      delete :destroy, id: @delivery
    end

    assert_redirected_to deliveries_path
  end
end
