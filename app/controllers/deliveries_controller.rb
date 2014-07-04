class DeliveriesController < ResourcesController
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def delivery_params
      params.require(:delivery).permit(:delivery_number, :partner_id, :delivery_date, :total_items, :total_amount, :creator_id, :delivery_staff_id, :accounting_voucher_number, :status)
    end
end
