class RenameAddressEmail < ActiveRecord::Migration
  def up
    rename_column :emails, :address, :email
    remove_index :emails, :address
    add_index :emails, :email, :unique => true
  end

  def down
    rename_column :emails, :email, :emails
    remove_index :emails, :email
    add_index :emails, :address, :unique => true
  end
end
