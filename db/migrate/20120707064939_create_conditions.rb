class CreateConditions < ActiveRecord::Migration
  def change
    create_table :conditions do |t|
      t.string :name, :null => false
      t.string :url_name, :null => false
      t.boolean :used, :null => false

      t.timestamps
    end

    add_index :conditions, :url_name, :unique => true
  end
end
