class ProductHistory < ActiveRecord::Base
  belongs_to :operate_sheet, polymorphic: true
  belongs_to :warehouse
  belongs_to :product
end
