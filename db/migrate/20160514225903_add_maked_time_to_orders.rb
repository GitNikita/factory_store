class AddMakedTimeToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :maked_time, :datetime
  end
end
