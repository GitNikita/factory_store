class Client < ActiveRecord::Base
	has_many :orders
	belongs_to :manager
	
	has_many :client_managers, dependent: :destroy
end
