require 'test_helper'

class GodownEntriesControllerTest < ActionController::TestCase
  setup do
    @godown_entry = godown_entries(:one)
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

  test "should show godown_entry" do
    get :show, id: @godown_entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @godown_entry
    assert_response :success
  end

  test "should update godown_entry" do
  end

end
