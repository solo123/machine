class OrderItemsController < ResourcesController
  def destroy
    load_object
    parent = @object.order
    if @object.status == 0
      @object.destroy
    end
    redirect_to parent
  end
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def order_item_params
      params.require(:order_item).permit(:order_id, :product_id, :godown_item_id, :price, :items, :amount, :notes, :status)
    end
end
