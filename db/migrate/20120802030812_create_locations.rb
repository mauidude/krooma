require 'csv'

class CreateLocations < ActiveRecord::Migration
  def up
    ActiveRecord::Base.transaction do
      create_table :locations do |t|
        t.string :postal_code, :null => false, :length => 5
        t.string :city, :null => false, :length => 30
        t.string :county, :length => 128
        t.string :state_code, :null => false, :length => 2
        t.string :country_code, :null => false, :length => 2
        t.string :timezone, :length => 64
        t.float :latitude, :null => false
        t.float :longitude, :null => false
        t.string :region, :length => 256
        t.integer :population
      end

      CSV.foreach("#{Rails.root}/db/zip_code_database.csv", :headers => true, :row_sep => "\r\n", :force_quotes => true) do |row|
        if row[1] == "STANDARD" && row[13] == "0"
          Location.create!(
            :postal_code => row[0],
            :city => row[2],
            :county => row[6],
            :state_code => row[5],
            :country_code => row[12],
            :timezone => row[7],
            :latitude => row[9],
            :longitude => row[10],
            :region => row[11],
            :population => row[14])
        end
      end
    end
  end

  def down
    drop_table :locations
  end
end
