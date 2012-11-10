class CreateColors < ActiveRecord::Migration
  def change
    create_table :colors do |t|
      t.string :name, :null => false
      t.boolean :external, :null => false
      t.timestamps
    end

    add_index :colors, [:name, :external], :unique => true

    change_table :cars do |t|
      t.references :interior_color, :null => false
      t.references :exterior_color, :null => false
    end
  end
end
