class CreateManagers < ActiveRecord::Migration
  def change
    create_table :managers do |t|
      t.string :name
      t.integer :phone
      t.string :email
      t.timestamps null: false
    end
  end
end
