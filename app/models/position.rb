class Position < ActiveRecord::Base
  belongs_to :product
  belongs_to :order

  def calc_price
    quantity * product.price
  end
end
