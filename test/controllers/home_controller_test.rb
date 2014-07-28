require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  setup do
    @godown_entry = godown_entries(:one)
    sign_in employees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end

