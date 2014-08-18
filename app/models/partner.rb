class Partner < ActiveRecord::Base
  has_one :account
  def to_s
    "#{self.partner_name}(#{self.contact} #{self.tel})"
  end
end
