class Product < ActiveRecord::Base
	validates :price, numericality: { greater_than: 0, allow_nill: true }
	validates :name, :type, :price, :description, :presence, presence: true
end
