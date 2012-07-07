class CreateTransmissions < ActiveRecord::Migration
  def change
    create_table :transmissions do |t|
      t.string :name, :null => false
      t.timestamps
    end

    change_table :cars do |t|
      t.references :transmission, :null => false
    end
  end
end
