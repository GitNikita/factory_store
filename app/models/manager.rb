class Manager < ActiveRecord::Base
  has_many :clients

  has_many :client_managers
end
