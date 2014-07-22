class WarehousesController < ResourcesController
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def warehouse_params
      params.require(:warehouse).permit(:name, :status)
    end
end
