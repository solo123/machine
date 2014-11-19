class GodownEntry < ActiveRecord::Base
  has_many :godown_items
  belongs_to :product
  belongs_to :warehouse
  belongs_to :creator, class_name: 'Employee'
  attr_accessor :import_text
  
  default_scope { order('id desc') }


  after_save :import

  def import
    # 产品名称，终端号，价格, 机身编号
    return true unless self.import_text
    OrderImport.import(self.import_text)
    self.import_text = nil
    true
  end
  def do_import
    OrderImport.all.each do |oi|
      item = self.godown_items.build
      item.terminal_code = oi.terminal_code
      item.sn_code = oi.sn_code
      item.price = oi.price
      if oi.product
        item.product = oi.product
      else
        p = Product.find_or_create_by(name: oi.product_name)
        item.product = p
      end
      item.save
      oi.destroy
    end
  end

  def recaculate
    self.godown_items.each {|item| item.recaculate}
    self.total_items = self.godown_items.count
    self.total_amount = self.godown_items.sum(:amount)
    self.save!
  end

  def valid_for_godown
    self.errors.clear
    if self.status > 0
      self.errors[:base] << "此单已经入库，不能再重复入库。"
      false
    elsif !GodownEntry.where(godown_number: self.godown_number).where('status > 0').empty?
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
      ProductsWarehouses.add(self.warehouse, item.product, item.items, self)
      item.warehouse = self.warehouse
      item.status = 1
      item.save!
    end
    self.status = 1
    self.save!
  end
end
