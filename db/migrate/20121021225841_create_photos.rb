class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.references :car, :null => false
      t.string :thumbnail_url, :limit => 1024, :null => false
      t.string :url, :limit => 1024, :null => false
      t.timestamps
    end
  end
end
