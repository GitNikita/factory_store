class RemoveProductFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :product, :integer
  end
end
