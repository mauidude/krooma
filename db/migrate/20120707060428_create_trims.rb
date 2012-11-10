class CreateTrims < ActiveRecord::Migration
  def change
    create_table :trims do |t|
      t.string :name, :null => false
      t.string :url_name, :null => false

      t.references :make, :null => false
      t.references :model, :null => false

      t.timestamps
    end

    add_index :trims, :url_name, :unique => true
  end
end
