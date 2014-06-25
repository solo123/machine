class OrdersController < ResourcesController
  def import
    lines = params['import_text'].split(/\n/)
    imp_lines = 0
    amount = 0.0
    order = nil
    lines.each do |line|
      cs = line.split(/[\t]/)
##=begin      
      cs.each_with_index do |c, idx|
        puts "cs[#{idx}] = #{cs[idx]}"
      end
##=end
      if cs.length>10 && cs[4] == '801075599990010'
        unless order
          order = Order.new
          order.order_date = cs[0]
          order.order_number = cs[3]
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
  end
  def stock_in
    i = 0
    params['item_ids'].each do |oid|
      item = OrderItem.find(oid)
      if item.status == 0
        item.status = 1
        item.save
        i += 1
      end
    end
    if i > 0
      flash[:notice] = "成功入库 #{i} 条记录!"
    else
      flash[:alert] = "没有新入库记录！"
    end
    redirect_to Order.find(params[:id])
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:order_date, :order_number, :provider_id, :status)
    end
end
