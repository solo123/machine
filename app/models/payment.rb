class Payment < ActiveRecord::Base
  belongs_to :order
  belongs_to :partner
  belongs_to :account
end
