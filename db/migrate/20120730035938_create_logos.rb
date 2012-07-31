class CreateLogos < ActiveRecord::Migration
  def change
    create_table :logos do |t|
      t.references :manufacturer, :null => false
      t.string :url, :length => 1024, :null => false
      t.timestamps
    end
  end
end
