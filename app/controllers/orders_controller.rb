class OrdersController < ResourcesController
  def index
    load_collection
    unless params[:cat]
      @collection = @collection.where(status: 0)
    end
  end

  def destroy
    load_object
    if @object.status == 0
      @object.destroy
    end
    redirect_to :action => :index
  end

  def add_item
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:order_date, :order_number, :partner_id, :contact_name, :contact_tel, :contact_email, :notes, :status)
    end
end
