class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
	  t.string :name
	  t.string :type
	  t.float  :price
	  t.string :description
	  t.integer :presence
      t.timestamps null: false
    end
    add_index :products, :name
    add_index :products, :price 
  end
end
