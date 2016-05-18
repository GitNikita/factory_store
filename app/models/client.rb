class Client < ActiveRecord::Base
  validates :name, :phone, :email, presence: true

  has_many :orders
  belongs_to :manager

  has_many :client_managers
  # , dependent: :destroy
end
