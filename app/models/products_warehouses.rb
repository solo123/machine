class ProductsWarehouses < ActiveRecord::Base
  belongs_to :warehouse
  belongs_to :product

  def self.current_items(warehouse, product)
    pw = ProductsWarehouses.where(warehouse_id: warehouse, product_id: product).first
    if pw
      pw.store_item
    else
      0
    end
  end
  def self.add(warehouse, product, items, op_object = nil)
    pw = ProductsWarehouses.where(warehouse: warehouse, product: product).first
    before_item = 0
    if pw
      before_item = pw.store_item
      pw.store_item += items
    else
      pw = ProductsWarehouses.new
      pw.warehouse = warehouse
      pw.product = product
      pw.store_item = items
    end
    pw.save!
    if op_object && op_object.has_attribute?('warehouse')
      op_object.warehouse = warehouse
      op_object.save
    end
    ph = ProductHistory.new(warehouse: warehouse, product: product, operate_sheet: op_object, before_items: before_item, change_items: items, now_items: pw.store_item)
    ph.save!
  end
end
