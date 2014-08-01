class GodownItemsController < ResourcesController
  def index
    @collection ||= GodownItem.where(status: 1).order(:terminal_code)
  end
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def godown_item_params
      params.require(:godown_item).permit(:godown_entry_id, :product_id, :terminal_code, :model, :sn_code, :price, :items, :amount, :status)
    end
end
