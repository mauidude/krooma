class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :car, :null => false
      t.references :recipient, :null => false
      t.text :text, :null => false
      t.timestamps
    end
  end
end
