class Product < ActiveRecord::Base
  validates :price, numericality: { greater_than: 0, allow_nill: true }
  validates :name, :type_of_product, :price, :description, presence: true

  has_many :positions
  has_many :orders, through: :positions

  def how_need
    positions.pluck(:quantity).sum
  end
end
