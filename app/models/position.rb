class Position < ActiveRecord::Base
	
	attr_accessible :product_id, :order_id, :quantity
	
	belongs_to :product
	belongs_to :order
end
