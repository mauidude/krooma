class CreateBodyStyles < ActiveRecord::Migration
  def change
    create_table :body_styles do |t|
      t.string :name, :null => false
      t.string :url_name, :null => false

      t.timestamps
    end

    add_index :body_styles, :url_name, :unique => true

    change_table :cars do |t|
      t.references :body_style, :null => false
    end
  end
end
