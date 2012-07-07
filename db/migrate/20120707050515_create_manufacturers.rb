class CreateManufacturers < ActiveRecord::Migration
  def change
    create_table :manufacturers do |t|
      t.string :name, :null => false
      t.string :url_name, :null => false

      t.timestamps
    end

    add_index :manufacturers, :url_name, :unique => true
  end
end
