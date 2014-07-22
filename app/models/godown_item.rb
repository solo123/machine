class GodownItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :godown_entry

  def recaculate
    if self.product
      unless self.price && self.price > 0
        self.price = self.product.godown_price
      end
      self.items = 1 unless self.items && self.items > 0
      self.price = 0 unless self.price
      self.amount = self.items * self.price
      self.save
    end
  end

end
