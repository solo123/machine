require 'test_helper'

class PartnersControllerTest < ActionController::TestCase
  setup do
    @partner = partners(:one)
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

  test "should create partner" do
    assert_difference('Partner.count') do
      post :create, partner: { partner_name: @partner.partner_name, contact: @partner.contact, email: @partner.email, qq: @partner.qq, status: @partner.status, tel: @partner.tel }
    end

  end

  test "should show partner" do
    get :show, id: @partner
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @partner
    assert_response :success
  end

  test "should update partner" do
    patch :update, id: @partner, partner: { partner_name: @partner.partner_name, contact: @partner.contact, email: @partner.email, qq: @partner.qq, status: @partner.status, tel: @partner.tel }
  end

end
