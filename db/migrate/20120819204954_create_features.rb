class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.string :name, :length => 50, :null => false
      t.timestamps
    end

    create_table :cars_features do |t|
      t.references :car, :null => false
      t.references :feature, :null => false
    end

    add_index :features, :name, :unique => true
    add_index :cars_features, [:car_id, :feature_id], :unique => true
  end
end
