class AddLocationsToCars < ActiveRecord::Migration
  def change
    change_table :cars do |t|
      t.references :location, :null => false
      t.integer :mileage, :null => false
    end
  end
end
