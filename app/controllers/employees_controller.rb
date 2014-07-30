class EmployeesController < ResourcesController
  def add
    #binding.pry
    params.permit!
    @object = Employee.new(params[:employee])
    if @object.save
      redirect_to employees_path
      return
    else
      @no_log = 1
    end
    render :new
  end
  private
    def employee_params
      params.require(:employee).permit(:email, :display_name, :password, :password_confirmation)
    end

end

