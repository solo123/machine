require 'test_helper'

class GodownEntriesControllerTest < ActionController::TestCase
  setup do
    @godown_entry = godown_entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:godown_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create godown_entry" do
    assert_difference('GodownEntry.count') do
      post :create, godown_entry: { creator_id: @godown_entry.creator_id, godown_number: @godown_entry.godown_number, status: @godown_entry.status, total_amount: @godown_entry.total_amount, total_items: @godown_entry.total_items }
    end

    assert_redirected_to godown_entry_path(assigns(:godown_entry))
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
    patch :update, id: @godown_entry, godown_entry: { creator_id: @godown_entry.creator_id, godown_number: @godown_entry.godown_number, status: @godown_entry.status, total_amount: @godown_entry.total_amount, total_items: @godown_entry.total_items }
    assert_redirected_to godown_entry_path(assigns(:godown_entry))
  end

  test "should destroy godown_entry" do
    assert_difference('GodownEntry.count', -1) do
      delete :destroy, id: @godown_entry
    end

    assert_redirected_to godown_entries_path
  end
end
