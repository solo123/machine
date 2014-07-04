class OrdersController < ResourcesController
  def index
    load_collection
    unless params[:cat]
      @collection = @collection.where(status: 0)
    end
  end
  def create
    lines = params['import_text'].split(/\n/)
    imp_lines = 0
    amount = 0.0
    order = nil
    lines.each do |line|
      cs = line.split(/[\t]/)
      if cs.length>10 && cs[4] == '801075599990010'
        unless order
          order = Order.new
          order.order_date = Date.strptime(cs[0], '%m/%d/%Y')
          order.order_number = cs[3]
          order.provider_id = params[:order][:provider_id]
##=begin      
      cs.each_with_index do |c, idx|
        puts "cs[#{idx}] = #{cs[idx]}"
      end
##=end
        end
        oi = order.order_items.build
        oi.t_code = cs[6]
        oi.model = cs[7]
        oi.sn_code = cs[8]
        oi.price = cs[9]
        oi.mobile_number = cs[10]
        oi.status = 0
        imp_lines += 1
        amount += oi.price
        oi.save
      end
    end
    if order
      order.total_items = imp_lines
      order.total_amount = amount
      order.save
      @object = order
    end
    flash[:notice] = "导入#{imp_lines}行数据。".html_safe
    redirect_to @object
  end
  def stock_in
    load_object
    if @object.stock_in
      flash[:notice] = "成功入库 #{@object.total_items} 台POS机!"
    else
      flash[:error] = '入库不成功，请检查！'
    end
    redirect_to @object
  end

  def destroy
    load_object
    if @object.status == 0
      @object.destroy
    end
    redirect_to :action => :index
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:order_date, :order_number, :provider_id, :status)
    end
end
