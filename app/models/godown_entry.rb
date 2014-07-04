class GodownEntry < ActiveRecord::Base
  has_many :godown_items
  attr_accessor :import_text
  attr_accessor :product_id

  def import
    # 型号，终端号，序列号，价格，数量
    return false unless self.import_text
    return false unless self.product_id

    lines = import_text.split(/\n/)
    imp_lines = 0
    amount = 0.0
    lines.each do |line|
      cs = line.split(/[\t]/)
      if cs.length >= 5
        item = self.godown_items.build
        item.product_id = self.product_id
        item.model = cs[0]
        item.terminal_code = cs[1]
        item.sn_code = cs[2]
        item.price = cs[3]
        item.items = cs[4] if cs[4]
        item.items = 1 if !item.items || (item.items < 1)
        item.amount = item.price * item.items
        item.status = 0
        imp_lines += 1
        amount += item.amount
        #puts "#{cs[0]},#{cs[1]},#{cs[2]},#{cs[3]},#{cs[4]}"
      end
    end
    self.save
    self.total_items = self.godown_items.count
    self.total_amount = self.godown_items.sum(:amount)
    self.save
  end
end
