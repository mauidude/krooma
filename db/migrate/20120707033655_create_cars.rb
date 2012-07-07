class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.references :make, :null => false
      t.references :model, :null => false
      t.references :trim
      t.references :poster, :null => false
      t.references :model_year, :null => false
      t.integer :asking_price, :null => false
      t.references :condition, :null => false
      t.string :vin, :limit => 17

      t.text :description, :null => false
      t.timestamps
    end
  end
end
