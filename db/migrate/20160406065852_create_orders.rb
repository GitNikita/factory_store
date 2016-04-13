class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
	  t.integer  :id_client
	  t.integer  :id_manager
	  t.integer :product
	  t.float   :price
	  t.float   :number
	  t.float   :order_price
      t.timestamps null: false
    end
  end
end
