class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :client_id
      t.integer :manager_id
      t.string :state
      t.float :order_price
      t.timestamps null: false
    end
  end
end
