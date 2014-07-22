require 'test_helper'

class ProductsControllerTest < ActionController::TestCase

  setup do
    @product = products(:one)
    sign_in employees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:collection)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: { catalog: @product.catalog, name: @product.name, status: @product.status }
    end

    assert_redirected_to product_path(assigns(:object))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    patch :update, id: @product, product: { catalog: @product.catalog, name: @product.name, status: @product.status }
    assert_redirected_to product_path(assigns(:object))
  end

=begin
  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
=end
end
