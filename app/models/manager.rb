class Manager < ActiveRecord::Base
  validates :name, :phone, :email, presence: true

  has_many :clients
  has_many :client_managers
end
