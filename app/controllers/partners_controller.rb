class PartnersController < ResourcesController
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def partner_params
      params.require(:partner).permit(:partner_name, :contact, :tel, :email, :qq, :status)
    end
end
