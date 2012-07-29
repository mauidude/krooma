class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :address, :null => false, :length => 256
      t.datetime :verified_at

      t.timestamps
    end

    add_index :emails, :address, :unique => true
  end
end
