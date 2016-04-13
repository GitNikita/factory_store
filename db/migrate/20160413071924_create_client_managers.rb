class CreateClientManagers < ActiveRecord::Migration
  def change
    create_table :client_managers do |t|
      t.integer :id_client
      t.integer :id_manager
      t.timestamps null: false
    end
  end
end
