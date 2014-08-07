module Biz
  class OrderBiz < BasicBiz
    def delivery(order)
      @errors.clear
      unless order.valid_for_order
        @errors << "invalid for order"
        return false
      end
      order.recaculate

      order.order_items.each do |item| 
        if item.status == 0 && item.godown_item && item.godown_item.reload && item.godown_item.status == 1
          ProductsWarehouses.add(item.godown_item.warehouse, item.product, -1, order)
          item.godown_item.status = 8
          item.godown_item.save!
          item.status = 1
          item.save!
        else
          err = "invalid order item: id:#{item.id},"
          if item.godown_item
            err += "godown_item:#{item.godown_item.id}, godown_item.status:#{item.godown_item.status}"
          else
            err += " nil godown_item"
          end
        end
      end
      order.status = 1 if order.order_items.where('status < 1').count == 0
      p = order.partner
      if p
        p.account = p.build_account unless p.account
        p.account.add(order.total_amount, order)
      end
      order.balance = order.total_amount
      order.save
    end

  end
end
