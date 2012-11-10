class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.string :name, :null => false
      t.string :url_name, :null => false
      t.references :make, :null => false

      t.timestamps
    end

    add_index :models, :url_name, :unique => true
  end
end