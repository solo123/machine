require 'test_helper'

class EmployeesControllerTest < ActionController::TestCase
  setup do
    sign_in employees(:one)
  end

  test "new employee" do
    get :new
    assert_response :success

    assert_difference('Employee.count') do
      post :add, employee: { email: 'email123@here.com', display_name: 'disp name', password: 'pass123123', password_confirmation: 'pass123123'}
    end
    assert_redirected_to employees_path
  end

end

