class CreateModelYears < ActiveRecord::Migration
  def change
    create_table :model_years do |t|
      t.integer :year, :null => false
      t.timestamps
    end

    add_index :model_years, :year, :unique => true

    create_table :model_years_models do |t|
      t.references :model, :null => false
      t.references :model_year, :null => false
    end

    add_index :model_years_models, [:model_id, :model_year_id], :unique => true
  end
end
