class CreateCarAlerts < ActiveRecord::Migration
  def change
    create_table :car_alerts do |t|
      t.references :email, :null => false
      t.datetime :verified_at
      t.text :search, :null => false

      t.timestamps
    end
  end
end
