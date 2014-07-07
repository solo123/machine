class GodownEntry < ActiveRecord::Base
  has_many :godown_items
  attr_accessor :import_text
  attr_accessor :product_id

  def import
    # 型号，终端号，序列号，价格，数量
    unless self.import_text
      self.errors[:base] << 'Empty import text'
      return false
    end
    unless self.product_id
      self.errors[:base] << 'No product_id'
      return false
    end

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
    self.save!
    recaculate
  end

  def recaculate
    self.total_items = self.godown_items.count
    self.total_amount = self.godown_items.sum(:amount)
    self.save!
  end

  def valid_for_godown
    self.errors.clear
    if !GodownEntry.where(godown_number: self.godown_number).where('status > 0').empty?
      self.errors[:base] << "Duplicate godown number #{self.godown_number}"
      false
    elsif self.total_items == nil || self.total_items < 1 || self.total_amount == nil || self.total_amount == 0
      self.errors[:base] << 'No godown items'
      false
    else
      true
    end
  end

  def do_godown
    valid_for_godown
    return false unless self.errors.empty?

    self.godown_items.each do |item|
      item.status = 1
      item.save!
    end
    self.status = 1
    self.save!
  end
end
