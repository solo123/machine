class OrdersController < ResourcesController
  autocomplete :godown_item, :terminal_code, full: :true

  def recaculate
    load_object
    @object.recaculate
    redirect_to @object
  end
  def add_item
    load_object
    oi = @object.order_items.build
    oi.godown_item = GodownItem.find(params[:godown_item_id])
    oi.product = oi.godown_item.product
    if oi.product
      oi.price = oi.amount = oi.product.sale_price
    end
    oi.items = 1
    oi.save
    redirect_to @object
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:order_date, :order_number, :partner_id, :contact_name, :contact_tel, :contact_email, :notes, :status)
    end
end
