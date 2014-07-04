class CompaniesController < ResourcesController
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :address, :manager, :tel, :email, :qq, :status)
    end
end
