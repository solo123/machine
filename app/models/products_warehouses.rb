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
  def self.add(warehouse, product, items)
    pw = ProductsWarehouses.where(warehouse_id: warehouse, product_id: product).first
    if pw
      pw.store_item += items
    else
      pw = ProductsWarehouses.new
      pw.warehouse = warehouse
      pw.product = product
      pw.store_item = items
    end
    pw.save!
  end
end
