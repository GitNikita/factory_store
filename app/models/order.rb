class Order < ActiveRecord::Base
  belongs_to :client
  belongs_to :manager
  has_many :positions
  has_many :products, through: :positions

  scope :maked, -> { where(state: 'waiting') }

  def calc_price
    positions.map(&:calc_price).sum
  end
end
