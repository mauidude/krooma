class CreateScrapedCars < ActiveRecord::Migration
  def change
    create_table :scraped_cars do |t|
      t.string :url, :limit => 4096, :null => false
      t.string :title, :limit => 4096, :null => false
      t.text :content, :null => false
      t.references :car
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
