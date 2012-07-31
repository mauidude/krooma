class AddMakeModelDescriptions < ActiveRecord::Migration
  def change
    change_table :manufacturers do |t|
      t.text :description, :null => false, :default => ""
    end

    change_table :models do |t|
      t.text :description, :null => false, :default => ""
    end
  end
end
