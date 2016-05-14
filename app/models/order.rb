class Order < ActiveRecord::Base
  belongs_to :client
  has_many :positions
  has_many :products, through: :positions
end
