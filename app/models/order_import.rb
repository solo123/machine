class OrderImport < ActiveRecord::Base
  belongs_to :product
  def self.import(import_text)
    # 产品名称， 终端编号，价格, 机身编号 
    import_text.split(/\n/).each do |line|
      cs = line.split(/[\t]/)
      if cs.length > 2
        oi = OrderImport.new(product_name: cs[0], terminal_code: cs[1], price: cs[2], status: 0)
        oi.sn_code = cs[3] if cs.length > 3
        oi.product = Product.find_by_name(oi.product_name) if oi.product_name
        oi.save
      end
    end
    true
  end
end
